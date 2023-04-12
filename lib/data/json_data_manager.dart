import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:txt_game_poc/data/narrative_data_model.dart';
import 'package:txt_game_poc/data/narrador_end_lines_data_model.dart';
import 'package:txt_game_poc/utils/player_prefs_save.dart';

class JsonDataManager {
  late NarrativeNodesListDataModel narrativeNodesList;
  late NarradorEndLinesDataModel narradorEndLinesData;

  Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  Future<NarrativeNodesListDataModel> loadNarrative({
    required String filePath,
  }) async {
    final savedNarrative = await PlayerPrefs.getHistoryFromPrefs();
    if (savedNarrative != null) return savedNarrative;

    final jsonProduct = await _loadJson(filePath);
    final jsonResponse = json.decode(jsonProduct);
    return narrativeNodesList =
        NarrativeNodesListDataModel.fromJson(jsonResponse);
  }

  Future<NarradorEndLinesDataModel> loadWithdrawLines({
    required String filePath,
  }) async {
    final jsonResponse = json.decode(await _loadJson(filePath));

    return narradorEndLinesData =
        NarradorEndLinesDataModel.fromJson(jsonResponse);
  }
}
