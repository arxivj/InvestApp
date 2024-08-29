import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_theme_colors.dart';
import 'package:untitled/presenter/fonts.gen.dart';
import 'package:untitled/presenter/themes/app_theme_style.dart';
import 'package:untitled/presenter/themes/app_theme_typography.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  // ThemeExtension<T>는 플러터의 테마 시스템을 확장할 때 사용하는 클래스
  // ThemeExtension을 통해 기본 제공되는 테마옵션 외에 추가적인 테마 옵션 정의 가능
  // AppTheme를 통해 커스텀 테마를 정의하고, light, dark theme에서 구체화
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typographies;
  final AppThemeStyles styles;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.styles = const AppThemeStyles(),
    this.typographies = const AppThemeTypography(),
    this.fontFamily = FontFamily.circularStd,
  });

  ColorScheme get baseColorScheme => brightness == Brightness.light
      ? const ColorScheme.light()
      : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this],
        brightness: brightness,
        primarySwatch: colors.primarySwatch,
        primaryColor: colors.primary,
        unselectedWidgetColor: colors.hint,
        disabledColor: colors.disabled,
        scaffoldBackgroundColor: colors.background,
        hintColor: colors.hint,
        highlightColor: colors.information,
        dividerColor: colors.border,
        fontFamily: fontFamily,
        colorScheme: baseColorScheme.copyWith(
          primary: colors.primary,
          onPrimary: colors.textOnPrimary,
          secondary: colors.secondary,
          onSecondary: colors.textOnPrimary,
          error: colors.error,
          shadow: colors.border,
        ),
     
      );

  @override
  AppTheme copyWith({
    String? name,
    Brightness? brightness,
    AppThemeColors? colors,
    AppThemeTypography? typographies,
    AppThemeStyles? styles,
  }) {
    return AppTheme(
      brightness: brightness ?? this.brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
      styles: styles ?? this.styles,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      name: name,
      brightness: brightness,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
    );
  }
}
