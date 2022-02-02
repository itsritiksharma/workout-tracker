import 'package:flutter/material.dart';

class AppMode with ChangeNotifier {
  ThemeMode _appMode;
  bool _isDarkMode;
  // var _appMode = ThemeMode.light;
  ThemeMode get appMode => _appMode;
  bool get isDark => _isDarkMode;

  AppMode({ThemeMode appMode = ThemeMode.light, bool isDark = false})
      : _appMode = appMode,
        _isDarkMode = isDark;

  void changeMode() {
    if (_appMode == ThemeMode.light) {
      _appMode = ThemeMode.dark;
      _isDarkMode = true;
    } else {
      _appMode = ThemeMode.light;
      _isDarkMode = false;
    }
    // _appMode = _appMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
