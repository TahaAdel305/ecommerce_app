import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void changeLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}