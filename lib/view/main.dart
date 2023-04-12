import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:txt_game_poc/data/models/models.dart';
import 'package:txt_game_poc/data/json_data_manager.dart';
import 'package:txt_game_poc/data/narrador_end_lines_data_model.dart';
import 'package:txt_game_poc/data/narrative_data_model.dart';
import 'package:txt_game_poc/utils/player_prefs_save.dart';
import 'package:txt_game_poc/view/styles/styles.dart';

bool debug = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'txt adventure poc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late NarrativeNodesListDataModel narrativeNodes;
  late NarradorEndLinesDataModel narradorEndLines;

  List<String> choiceState = [];
  int currentTextNode = 0;
  int savedNodeIndex = 0;
  bool showStorytellerLines = false;
  bool debugHasSavedHistory = false;

  Future<List> initialize() async {
    narrativeNodes = await JsonDataManager.loadNarrative(
      filePath: 'assets/json/narrativa_1.json',
    );

    narradorEndLines = await JsonDataManager.loadWithdrawLines(
      filePath: 'assets/json/storyteller/withdraw_lines.json',
    );

    return [narrativeNodes, narradorEndLines];
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void saveGame() {
    bool canSave = narrativeNodes.narrative[currentTextNode].save ?? false;
    if (!canSave) return;

    final saveIndex = narrativeNodes.narrative[currentTextNode].id;
    savedNodeIndex = saveIndex - 1;

    PlayerPrefs.saveProgress(savedNodeIndex);
    PlayerPrefs.saveHistoryInPrefs(narrativeNodes);
  }

  void setCurrentTextNode(OptionNodeDataModel option) {
    if (option.nextNode == -1) {
      setState(() {
        currentTextNode = savedNodeIndex;
        showStorytellerLines = true;
      });
      return;
    }

    setState(() {
      currentTextNode = option.nextNode - 1;

      if (option.setState == null) return;
      setChoiceState(option);
    });
  }

  void setChoiceState(OptionNodeDataModel option) {
    final optionStates = option.setState!.keys.toList();
    final optionValues = option.setState!.values.toList();
    for (var i = 0; i < option.setState!.length; i++) {
      if (optionValues[i]) {
        if (choiceState.contains(optionStates[i])) return;

        choiceState.add(optionStates[i]);
      } else {
        choiceState.removeWhere((state) => state == optionStates[i]);
      }
    }
  }

  void removeOptionNode(OptionNodeDataModel option) {
    final remove = option.removeParams;
    if (remove == null) return;

    final index = remove.id - 1;
    final nodeOptions = narrativeNodes.narrative[index].options;
    nodeOptions.removeWhere((option) => option.index == remove.optionIndex);
    narrativeNodes.narrative[remove.id - 1].options = nodeOptions;
    PlayerPrefs.saveHistoryInPrefs(narrativeNodes);
  }

  void onChoiceSubmitted(OptionNodeDataModel option) {
    saveGame();
    setCurrentTextNode(option);
    removeOptionNode(option);
  }

  void onTryAgainSubmitted() => setState(() => showStorytellerLines = false);

  bool requiredStateExists(OptionNodeDataModel option) {
    final requiredStateKeys = option.requiredState?.keys.toList() ?? [];
    // print('contains? ${choiceState.contains(state)}');
    return requiredStateKeys.every(
      (state) => choiceState.contains(state),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 145, 127),
      bottomNavigationBar: debug ? debugState() : null,
      appBar: AppBar(
        title: const Text('Poc'),
        leadingWidth: 80.0,
        leading: debug
            ? Row(
                children: [
                  IconButton(
                    onPressed: debugNarrativeBottomSheet,
                    icon: const Icon(Icons.info),
                    iconSize: 20,
                  ),
                  const IconButton(
                    onPressed: PlayerPrefs.clearPrefs,
                    icon: Icon(Icons.remove_circle),
                    iconSize: 20,
                  ),
                ],
              )
            : null,
        actions: [
          IconButton(
            onPressed: () => setState(
              () => debug = !debug,
            ),
            icon: const Icon(Icons.developer_mode_outlined),
            iconSize: 20,
            color: showStorytellerLines ? Colors.white : Colors.grey,
          ),
        ],
      ),
      body: FutureBuilder(
          future: initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return narrativeWidget();
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  void debugNarrativeBottomSheet() async {
    final savedNarrativeJson = await PlayerPrefs.getHistoryFromPrefs();
    final currentNarrative = narrativeNodes.narrative
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 4.0,
            ),
            child: SelectableText(
              json.encode(
                e.toJson(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
        .toList();
    final narrative = savedNarrativeJson == null
        ? currentNarrative
        : savedNarrativeJson.narrative
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 4.0,
                ),
                child: SelectableText(
                  json.encode(
                    e.toJson(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setModalState) {
            final canShowSaved =
                savedNarrativeJson != null && debugHasSavedHistory;

            return Container(
              color: Colors.grey[700],
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  TextButton(
                    onPressed: () => setModalState(() {
                      debugHasSavedHistory = !debugHasSavedHistory;
                    }),
                    child: Text(
                      !canShowSaved ? 'currentNarrative' : 'savedNarrative',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.blueGrey[800],
                    child: Text(
                      json.encode(narrativeNodes.narrative[currentTextNode]),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ...narrative,
                ],
              )),
            );
          });
        });
  }

  Widget debugState() {
    return Container(
      padding: const EdgeInsets.only(top: 4.8, left: 12.0),
      height: 30.0,
      color: const Color.fromARGB(255, 141, 32, 32),
      child: Text(
        'currentState: $choiceState',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget narrativeWidget() {
    final randomLine = Random().nextInt(
      narradorEndLines.lines.length,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/564x/94/7b/ad/947badfba69962a84d80fa1e4afb55c2.jpg',
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black45,
          thickness: 2.0,
          indent: 10.0,
          endIndent: 10.0,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 12.0),
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
            child: ClipPath(
              clipper: NotebookClipper(),
              child: CustomPaint(
                painter: NotebookPainter(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 26.0,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 25, top: 25, right: 25),
                        child: SelectableText(
                          !showStorytellerLines
                              ? narrativeNodes.narrative[currentTextNode].title
                              : narradorEndLines.lines[randomLine],
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      !showStorytellerLines
                          ? choicesWidget()
                          : tryAgainChoices(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget choicesWidget() {
    final adventureOptions = narrativeNodes.narrative[currentTextNode].options;

    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      margin: const EdgeInsets.only(top: 15.0),
      child: ListView(
        primary: false,
        physics: null,
        shrinkWrap: true,
        children: adventureOptions.map(
          (option) {
            if (option.requiredState == null || requiredStateExists(option)) {
              return choiceButton(
                onSubmmit: () => onChoiceSubmitted(option),
                optionText: option.text,
              );
            }
            return Container();
          },
        ).toList(),
      ),
    );
  }

  Widget choiceButton({
    required VoidCallback onSubmmit,
    required String optionText,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 2.4, color: Colors.black45),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(bottom: 20.0, top: 12.0),
        ),
        onPressed: onSubmmit,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(top: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.remove,
                color: Colors.red[600],
                size: 30.0,
              ),
              const SizedBox(width: 12.0),
              Text(
                optionText,
                style: TextStyle(
                  color: Colors.grey[900]!,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tryAgainChoices() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      margin: const EdgeInsets.only(top: 15.0),
      child: choiceButton(
        onSubmmit: onTryAgainSubmitted,
        optionText: '...',
      ),
    );
  }
}
