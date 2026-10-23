import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}