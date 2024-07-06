import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;
  late SharedPreferences _prefs;

  ThemeNotifier(this._themeData) {
    _loadFromPrefs();
  }

  ThemeData getTheme() => _themeData;

  Future<void> setTheme(ThemeData themeData) async {
    _themeData = themeData;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    bool isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    await _initPrefs();
    bool isDarkMode = _themeData == ThemeData.dark();
    await _prefs.setBool('isDarkMode', isDarkMode);
  }
}
