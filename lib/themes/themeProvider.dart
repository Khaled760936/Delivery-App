import 'package:flutter/material.dart';
import 'package:test/themes/darkMode.dart';
import 'package:test/themes/lightMode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = LightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == LightMode) {
      themeData = DarkMode;
    } else {
      themeData = LightMode;
    }
  }
}
