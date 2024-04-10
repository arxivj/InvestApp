import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/color/app_colors.dart';
import 'root.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder:  (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primarySeed,
                brightness: Brightness.light,
              )),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primarySeed, brightness: Brightness.dark),
          ),
          themeMode: currentMode,
          home: const Root(),
          scrollBehavior: AppScrollBehavior(),
        );
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
