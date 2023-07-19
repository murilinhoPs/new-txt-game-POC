import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txt_game_poc/data/json_data_manager.dart';
import 'package:txt_game_poc/view/text_game_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    Key? key,
    required this.narrativeJsonPath,
    required this.narradorLinesJsonPath,
  }) : super(key: key);
  final String narrativeJsonPath;
  final String narradorLinesJsonPath;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late JsonDataManager jsonData;

  @override
  void initState() {
    jsonData = JsonDataManager(
      narrativeJsonPath: widget.narrativeJsonPath,
      narradorLinesJsonPath: widget.narradorLinesJsonPath,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'txt adventure poc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder(
        future: jsonData.initData,
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return MultiProvider(
            providers: [
              Provider<JsonDataManager>(create: (_) => jsonData),
            ],
            child: const TextGamePage(),
          );
        }),
      ),
    );
  }
}
