import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';
import '../app_theme_style.dart';
import '../app_themes.dart';

class DarkAppTheme extends AppTheme {
  const DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: const AppThemeColors(
            primarySwatch: Colors.teal,
            primary: Color(0xFFFFFFFF),
            secondary: Color(0xFF3e80dd),
            accent: Color(0xFF27C754),
            background: Color(0xFF303030),
            backgroundDark: Color(0xFF202020),
            disabled: Color(0xFF3a3a3a),
            information: Color(0xB3FFFFFF),
            success: Color(0xFF4CAF50),
            alert: Color(0xFFFFC107),
            warning: Color(0xFFF44336),
            error: Color(0xFFD32F2F),
            text: Color(0xFFFFFFFF),
            textOnPrimary: Color(0xFF3a3a3a),
            border: Color(0xFF4CAF50),
            hint: Color(0xB3FFFFFF),
          ),
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
