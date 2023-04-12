import 'package:flutter/material.dart';
import 'package:txt_game_poc/view/app_widget.dart';

void main() {
  runApp(const AppWidget(
    narrativeJsonPath: 'assets/json/narrativa_1.json',
    narradorLinesJsonPath: 'assets/json/storyteller/withdraw_lines.json',
  ));
}
