import 'package:flutter/material.dart';

import '../../../color/app_colors.dart';
import '../app_theme_style.dart';
import '../app_themes.dart';

class LightAppTheme extends AppTheme {
  const LightAppTheme()
      : super(
    name: 'light',
    brightness: Brightness.light,
    colors: const AppThemeColors(
      primarySwatch: Colors.teal,
      primary: Color(0xFF000000),
      secondary: Color(0xFF6C79DB),
      accent: Color(0xFF27C754),
      background: Color(0xFFF7F7F7),
      backgroundDark: Color(0xFFEEEEEE),
      disabled: Color(0xFFCCCCCC),
      information: Color(0xFF6C79DB),
      success: Color(0xFF4CAF50),
      alert: Color(0xFFFFC107),
      warning: Color(0xFFF44336),
      error: Color(0xFFD32F2F),
      text: Color(0xFF212121),
      textOnPrimary: Color(0xFFFFFFFF),
      border: Color(0xFFBDBDBD),
      hint: Color(0x80000000),
    ),
    styles: const AppThemeStyles(
      cardShadow: [
        BoxShadow(
          color: Color(0x29000000),
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      ],
    ),
  );
}
