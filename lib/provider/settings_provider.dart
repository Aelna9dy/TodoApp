import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;
    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackground() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/splash_darkTheme.png"
        : "assets/images/splash.png";
  }
}
