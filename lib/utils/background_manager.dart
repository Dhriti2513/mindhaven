import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundManager extends ChangeNotifier {
  String _backgroundTheme = 'default';

  String get backgroundTheme => _backgroundTheme;

  Future<void> loadBackgroundTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _backgroundTheme = prefs.getString('background_theme') ?? 'default';
    notifyListeners();
  }

  Future<void> changeBackgroundTheme(String theme) async {
    _backgroundTheme = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('background_theme', theme);
    notifyListeners();
  }

  String getBackgroundPath(bool isDark) {
    switch (_backgroundTheme) {
      case 'calm':
        return isDark
            ? 'assets/images/calm_dark.jpeg'
            : 'assets/images/calm.jpeg';
      case 'forest':
        return isDark
            ? 'assets/images/forest_dark.jpeg'
            : 'assets/images/forest.jpeg';
      case 'galaxy':
        return isDark
            ? 'assets/images/galaxy_dark.jpeg'
            : 'assets/images/galaxy.jpeg';
      default:
        return isDark
            ? 'assets/images/bg_default_dark.jpeg'
            : 'assets/images/bg_default_light.jpeg';
    }
  }
}
