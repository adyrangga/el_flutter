import 'package:flutter/material.dart';

class ThemeManagerProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isDarkMode = false;
  bool _isFollowDeviceTheme = false;

  ThemeMode get themeMode => _themeMode;
  bool get darkMode => _isDarkMode;
  bool get followDeviceTheme => _isFollowDeviceTheme;

  void setThemeMode(ThemeMode themeMode, bool isBrightnessDark) {
    _themeMode = themeMode;
    _isDarkMode = isBrightnessDark;
    notifyListeners();
  }

  void setDarkMode(bool value, [ThemeMode? themeMode]) {
    _isDarkMode = value;
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    if (themeMode != null &&
        themeMode == ThemeMode.system &&
        _isFollowDeviceTheme) {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void setFollowDeviceTheme(bool value) {
    _isFollowDeviceTheme = value;
    notifyListeners();
  }
}
