import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';

Widget ThemeButton() {
  return Builder(
    builder: (context) {
      return ElevatedButton(
        onPressed: () {
          final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
          if (themeProvider.themeMode == ThemeMode.light) {
            themeProvider.setThemeMode(ThemeMode.dark);
          } else {
            themeProvider.setThemeMode(ThemeMode.light);
          }
        },
        child: Text('Toggle Theme Mode'),
      );
    },
  );
}
