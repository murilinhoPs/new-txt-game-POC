import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

class PlayerPrefs {
  static const String curentTextKey = 'curentText';
  static const String jsonKey = 'gameHistory';

  static Future<bool> saveProgress(nextText) async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.setInt(curentTextKey, nextText);

    return value;
  }

  static Future<int> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getInt(curentTextKey) ?? 0;

    return value;
  }

  static Future<void> clearPrefs() async {
    final preferences = await SharedPreferences.getInstance();

    preferences.remove(curentTextKey);
    preferences.remove(jsonKey);
  }

  static saveHistoryInPrefs(AllNarrativeNodesList adventure) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(jsonKey, json.encode(adventure));
  }

  static Future<AllNarrativeNodesList?> getHistoryFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final getAdventure = prefs.getString(jsonKey);
    if (getAdventure == null) return null;

    final newAdventureString = json.decode(getAdventure);
    final newAdventure = AllNarrativeNodesList.fromJson(newAdventureString);

    return newAdventure;
  }
}
