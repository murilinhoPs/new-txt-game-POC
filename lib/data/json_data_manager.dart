import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:txt_game_poc/data/narrative_data_model.dart';
import 'package:txt_game_poc/data/narrador_end_lines_data_model.dart';
import 'package:txt_game_poc/utils/player_prefs_save.dart';

class JsonDataManager {
  JsonDataManager({
    required this.narrativeJsonPath,
    required this.narradorLinesJsonPath,
  });
  final String narrativeJsonPath;
  final String narradorLinesJsonPath;

  late NarrativeNodesListDataModel narrativeNodesList;
  late NarradorEndLinesDataModel narradorEndLinesData;

  Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  Future<NarrativeNodesListDataModel> loadNarrative() async {
    final savedNarrative = await PlayerPrefs.getHistoryFromPrefs();
    if (savedNarrative != null) return savedNarrative;

    final jsonProduct = await _loadJson(narrativeJsonPath);
    final jsonResponse = json.decode(jsonProduct);
    return narrativeNodesList =
        NarrativeNodesListDataModel.fromJson(jsonResponse);
  }

  Future<NarradorEndLinesDataModel> loadNarradorEndLines() async {
    final jsonResponse = json.decode(await _loadJson(narradorLinesJsonPath));

    return narradorEndLinesData =
        NarradorEndLinesDataModel.fromJson(jsonResponse);
  }

  Future<List> initData() async => [
        await loadNarradorEndLines(),
        await loadNarrative(),
      ];
}
