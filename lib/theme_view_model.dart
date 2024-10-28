import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  void changeTheme() {
    _themeData = (themeData.brightness == Brightness.dark)
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}
