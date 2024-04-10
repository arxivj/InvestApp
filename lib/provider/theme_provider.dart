import 'package:flutter/material.dart';

/// [ThemeProvider]는 초기에는 시스템 테마 모드로 설정되어 있으며, 버튼 같은걸 통해 테마 모드를 변경할 수 있도록 구성함
class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.system; // 초기 테마 모드 설정

  ThemeMode get themeMode => _themeMode; // 현재 테마 모드를 가져옴

  void setThemeMode(ThemeMode mode) { // 테마 모드 설정
    _themeMode = mode;
    notifyListeners();
  }
}
