// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

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
