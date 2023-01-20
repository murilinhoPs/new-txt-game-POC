import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';

class JsonManager {
  final String jsonKey = 'gameHistory';

  static Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  static Future<AllNarrativeNodesList> loadNarrative({
    required String file,
  }) async {
    final jsonProduct = await _loadJson(file);
    final jsonResponse = json.decode(jsonProduct);

    final allNarrativeNodes = AllNarrativeNodesList.fromJson(jsonResponse);

    return allNarrativeNodes;
  }

  static Future<WithdrawLines> loadWithdrawLines({
    required String file,
  }) async {
    final jsonResponse = json.decode(await _loadJson(file));

    return WithdrawLines.fromJson(jsonResponse);
  }
}
