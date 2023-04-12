import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:txt_game_poc/data/models/models.dart';
import 'package:txt_game_poc/utils/player_prefs_save.dart';

class JsonDataManager {
  static Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  static Future<NarrativeNodesListDataModel> loadNarrative({
    required String file,
  }) async {
    final savedNarrative = await PlayerPrefs.getHistoryFromPrefs();
    if (savedNarrative != null) return savedNarrative;

    final jsonProduct = await _loadJson(file);
    final jsonResponse = json.decode(jsonProduct);
    return NarrativeNodesListDataModel.fromJson(jsonResponse);
  }

  static Future<WithdrawLinesDataModel> loadWithdrawLines({
    required String file,
  }) async {
    final jsonResponse = json.decode(await _loadJson(file));

    return WithdrawLinesDataModel.fromJson(jsonResponse);
  }
}
