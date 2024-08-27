import 'package:flutter/material.dart';
import 'app_colors.dart';

// [AppThemeColors] : AppColors에 정의된 색상들을 사용하여 테마에 필요한 색상 팔레트를 구성
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

  static AppThemeColors fromAppColors({
    required bool isDarkMode,
  }) {
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
      primary: isDarkMode ? AppColors.onPrimary : AppColors.primarySeed,
      secondary: isDarkMode ? AppColors.onSurface : AppColors.secondary,
      accent: isDarkMode ? AppColors.primarySeed : AppColors.secondaryVariant,
      background: isDarkMode ? AppColors.background : AppColors.background,
      backgroundDark: isDarkMode ? AppColors.backgroundDark : AppColors.background,
      disabled: isDarkMode ? AppColors.surface : AppColors.surface,
      information: isDarkMode ? AppColors.onBackground : AppColors.secondary,
      success: isDarkMode ? AppColors.primaryVariant : AppColors.primaryVariant,
      alert: isDarkMode ? AppColors.error : AppColors.error,
      warning: isDarkMode ? AppColors.secondaryVariant : AppColors.secondaryVariant,
      error: isDarkMode ? AppColors.error : AppColors.error,
      text: isDarkMode ? AppColors.onPrimary : AppColors.onBackground,
      textOnPrimary: isDarkMode ? AppColors.onSurface : AppColors.onPrimary,
      border: isDarkMode ? AppColors.primarySeed : AppColors.surface,
      hint: isDarkMode ? AppColors.onSurface : AppColors.onSurface,
    );
  }

  AppThemeColors lerp(covariant dynamic other, double t) {
    // 여기서 covariant 키워드는 실질적으로 별 의미가 없지만, 해당 메서드를 override 하는 쪽에서 covariant 키워드를 사용한다는걸 명시하기 위해 작성
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
