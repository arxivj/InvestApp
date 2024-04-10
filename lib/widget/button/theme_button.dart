import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

Widget ThemeButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // 현재 테마 모드를 체크하고, 클릭시 테마 전환
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      if (themeProvider.themeMode == ThemeMode.light) {
        themeProvider.setThemeMode(ThemeMode.dark);
      } else {
        themeProvider.setThemeMode(ThemeMode.light);
      }
    },
    child: Text('Toggle Theme Mode'),
  );
}