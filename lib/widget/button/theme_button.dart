import 'package:flutter/material.dart';
import '../../main.dart';

Widget ThemeButton(BuildContext context) {
  return ValueListenableBuilder<ThemeMode>(
    valueListenable: MyApp.themeNotifier,
    builder: (_, currentThemeMode, __) {
      return IconButton(
        onPressed: () {
          MyApp.themeNotifier.value = currentThemeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
        },
        icon: Icon(
            currentThemeMode == ThemeMode.light ? Icons.light_mode : Icons.dark_mode
        ),
      );
    },
  );
}
