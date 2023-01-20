import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'models.dart';

class AdventureJson {
  final String jsonKey = 'gameHistory';

  static Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  static Future<AllNarrativeNodesList> loadNarrative(
      {required String file}) async {
    final jsonProduct = await _loadJson(file);
    final jsonResponse = json.decode(jsonProduct);

    final allNarrativeNodes = AllNarrativeNodesList.fromJson(jsonResponse);

    return allNarrativeNodes;
  }
}
