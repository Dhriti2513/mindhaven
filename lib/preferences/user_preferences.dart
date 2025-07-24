import 'package:flutter/material.dart';

class UserPreferences extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');
  double _fontScale = 1.0;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  double get fontScale => _fontScale;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }

  void setFontScale(double scale) {
    _fontScale = scale;
    notifyListeners();
  }
}
