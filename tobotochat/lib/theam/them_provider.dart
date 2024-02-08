import 'package:chat/theam/dark_mode.dart';
import 'package:chat/theam/light_mode.dart';
import 'package:flutter/material.dart';

class ThemProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themData => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkmode;
    } else {
      themeData = lightMode;
    }
    notifyListeners(); // Tema değiştiğinde dinleyicilere bildirilmesi için notifyListeners() çağrılır.
  }
}
