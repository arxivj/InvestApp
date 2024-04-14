import 'package:flutter/material.dart';

class AppColors {
  static const Color primarySeed = Color(0xFF30D5C8);
  static const Color primaryVariant = Color(0xFF008B8B);
  static const Color secondary = Color(0xFF80CBC4);
  static const Color secondaryVariant = Color(0xFF00695C);
  static const Color background = Color(0xFFF0F4F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onError = Color(0xFFFFFFFF);
}

class AppThemeColors {
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color textOnPrimary;
  final Color border;
  final Color hint;

  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.textOnPrimary,
    required this.border,
    required this.hint,
  });

  static AppThemeColors fromAppColors() {
    Map<int, Color> swatch = {
      50: AppColors.primarySeed.withOpacity(0.1),
      100: AppColors.primarySeed.withOpacity(0.2),
      200: AppColors.primarySeed.withOpacity(0.3),
      300: AppColors.primarySeed.withOpacity(0.4),
      400: AppColors.primarySeed.withOpacity(0.5),
      500: AppColors.primarySeed.withOpacity(0.6),
      600: AppColors.primarySeed.withOpacity(0.7),
      700: AppColors.primarySeed.withOpacity(0.8),
      800: AppColors.primarySeed.withOpacity(0.9),
      900: AppColors.primarySeed,
    };
    MaterialColor primarySwatch = MaterialColor(AppColors.primarySeed.value, swatch);

    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: AppColors.primarySeed,
      secondary: AppColors.secondary,
      accent: AppColors.secondaryVariant,
      background: AppColors.background,
      backgroundDark: AppColors.background,
      disabled: AppColors.surface,
      information: AppColors.secondary,
      success: AppColors.primaryVariant,
      alert: AppColors.error,
      warning: AppColors.secondaryVariant,
      error: AppColors.error,
      text: AppColors.onBackground,
      textOnPrimary: AppColors.onPrimary,
      border: AppColors.surface,
      hint: AppColors.onSurface,
    );
  }

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }
}