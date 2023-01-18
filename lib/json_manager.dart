import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'models.dart';

late AllNarrativeNodesList narrativeNodes;

class AdventureJson {
  final String jsonKey = 'gameHistory';

  static Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  static Future<void> loadNarrative({required String file}) async {
    final jsonProduct = await _loadJson(file);
    final jsonResponse = json.decode(jsonProduct);

    narrativeNodes = AllNarrativeNodesList.fromJson(jsonResponse);

    // return narrativeNodes;
  }
}
