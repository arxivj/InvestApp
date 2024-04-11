import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isInitialLoad = true;

  ThemeMode get themeMode => _themeMode;
  bool get isInitialLoad => _isInitialLoad;

  ThemeProvider() {
    loadThemeMode();
  }

  void setThemeMode(ThemeMode mode, {bool isUserInitiated = false}) async {
    _themeMode = mode;
    if (isUserInitiated) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('themeMode', mode.toString());
      _isInitialLoad = false;
    }
    notifyListeners();
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString('themeMode');

    if (themeModeString != null) {
      _themeMode = ThemeMode.values.firstWhere(
            (e) => e.toString() == themeModeString,
        orElse: () => ThemeMode.system,
      );
      _isInitialLoad = false;
    }
    notifyListeners();
  }
}