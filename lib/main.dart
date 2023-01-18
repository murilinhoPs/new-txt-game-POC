import 'package:flutter/material.dart';

import 'json_manager.dart';
import 'models.dart';
import 'styles/notebook_custom_clipper.dart';
import 'styles/notebook_custom_paint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'txt adventure poc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Poc Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> choiceState = [];
  int nextTextNode = 0;

  void setNextTextNode(Option option) {
    setState(() {
      nextTextNode = option.nextNode - 1;

      if (option.setState == null) return;
      final optionStates = option.setState!.keys.toList();
      final optionValues = option.setState!.values.toList();

      for (var i = 0; i < option.setState!.length; i++) {
        if (optionValues[i] == true) {
          choiceState.add(optionStates[i]);
          print('true: $choiceState');
          return;
        }

        if (choiceState.isEmpty) return;
        choiceState.removeWhere((state) => state == optionStates[i]);
        print('false: $choiceState');
      }
    });
  }

  @override
  void initState() {
    AdventureJson.loadNarrative(file: 'assets/json/narrativa_1.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 145, 127),
      bottomNavigationBar: debugState(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: AdventureJson.loadNarrative(
            file: 'assets/json/narrativa_1.json',
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return narrativeWidget();
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget debugState() {
    return Container(
      padding: const EdgeInsets.only(top: 4.8, left: 12.0),
      height: 30.0,
      color: Colors.grey[700],
      child: Text(
        'currentState: $choiceState',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget narrativeWidget() {
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
            // width: 400, //MediaQuery.of(context).size.width,
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
                          narrativeNodes.narrative[nextTextNode].title,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      choicesWidget(),
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
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      margin: const EdgeInsets.only(top: 15.0),
      child: ListView(
        primary: false,
        physics: null,
        shrinkWrap: true,
        children: choicesButtons(),
      ),
    );
  }

  choicesButtons() {
    var adventureOptions =
        narrativeNodes.narrative[nextTextNode].options; //next value

    return adventureOptions.map(
      (option) {
        final requiredStateKeys = option.requiredState?.keys.toList() ?? [];
        final requiredStateExists =
            requiredStateKeys.every((state) => choiceState.contains(state));

        if (option.requiredState == null || requiredStateExists) {
          return choiceButton(context, option);
        }
        return Container();
      },
    ).toList();
  }

  Widget choiceButton(context, Option option) {
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
                option.text,
                style: TextStyle(
                  color: Colors.grey[900]!,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        onPressed: () => setNextTextNode(option),
      ),
    );
  }
}
