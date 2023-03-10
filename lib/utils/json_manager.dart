import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/models.dart';
import 'player_prefs_save.dart';

class JsonManager {
  static Future<String> _loadJson(String json) async {
    return await rootBundle.loadString(json);
  }

  static Future<AllNarrativeNodesList> loadNarrative({
    required String file,
  }) async {
    final savedNarrative = await PlayerPrefs.getHistoryFromPrefs();
    if (savedNarrative != null) return savedNarrative;

    final jsonProduct = await _loadJson(file);
    final jsonResponse = json.decode(jsonProduct);
    return AllNarrativeNodesList.fromJson(jsonResponse);
  }

  static Future<WithdrawLines> loadWithdrawLines({
    required String file,
  }) async {
    final jsonResponse = json.decode(await _loadJson(file));

    return WithdrawLines.fromJson(jsonResponse);
  }
}
