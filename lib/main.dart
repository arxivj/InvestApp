import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presenter/themes/mode/dark_theme.dart';
import 'package:untitled/presenter/themes/mode/light_theme.dart';
import 'package:untitled/provider/theme_provider.dart';
import 'package:untitled/utils/korea_investment_config.dart';
import 'package:untitled/utils/korea_investment_inquire_service.dart';
import 'root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await KoreaInvestmentConfig.loadConfig();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => InquireService()),
      ],
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
      debugShowCheckedModeBanner: false,
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
