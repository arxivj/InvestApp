import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_theme_colors.dart';
import '../app_theme_style.dart';
import '../app_themes.dart';

class DarkAppTheme extends AppTheme {
   DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: AppThemeColors.fromAppColors(isDarkMode: true),
          styles: const AppThemeStyles(
            cardShadow: [
              BoxShadow(
                color: Color(0x4D000000),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        );
}
