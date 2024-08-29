import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_theme_colors.dart';
import 'package:untitled/presenter/themes/app_theme_style.dart';
import 'package:untitled/presenter/themes/app_themes.dart';

class LightAppTheme extends AppTheme {
  LightAppTheme()
      : super(
          name : 'light',
          brightness: Brightness.light,
          colors: AppThemeColors.fromAppColors(isDarkMode: false),
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
