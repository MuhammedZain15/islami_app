import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguageCode = "en";
  ThemeMode currentThemeMode = ThemeMode.dark;

  void changeLanguageCode(String newLanguageCode) {
    if (currentLanguageCode == newLanguageCode) return;
    currentLanguageCode = newLanguageCode;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  String getHomeBackground() {
    return isDark()
        ? "assets/images/dark_bg.png"
        : "assets/images/default_bg.png";
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }
}
