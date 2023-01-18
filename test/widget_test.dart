// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:txt_game_poc/main.dart';

void main() {
  test('test', () {
    List<String> choiceState = ['jar', 'jar', 'jar', 'teste'];
    print('antes: $choiceState');

    int duplicateDetectedCount = -1;
    String duplicateItem = '';
    for (String item in choiceState) {
      for (String innerItem in choiceState) {
        if (item == innerItem) {
          duplicateDetectedCount++;
          if (duplicateDetectedCount == 1) {
            duplicateItem = innerItem;
          }
          print('count: $duplicateDetectedCount');
        }
      }
    }

    choiceState.removeWhere((state) => state == duplicateItem);
    print('depois: $choiceState');
  });
}
