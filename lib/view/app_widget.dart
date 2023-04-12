import 'package:flutter/material.dart';
import 'package:txt_game_poc/view/text_game_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'txt adventure poc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TextGamePage(),
    );
  }
}
