import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presenter/colors/app_colors.dart';
import 'package:untitled/presenter/themes/mode/dark_theme.dart';
import 'package:untitled/presenter/themes/mode/light_theme.dart';
import 'package:untitled/provider/theme_provider.dart';
import 'root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  runApp(
    ChangeNotifierProvider(
      create: (context) => themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Untitled',
      theme: const LightAppTheme().themeData,
      darkTheme: const DarkAppTheme().themeData,
      themeMode: themeProvider.themeMode,
      home: const Root(),
      scrollBehavior: AppScrollBehavior(),
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
