import 'package:flutter/material.dart';

// [AppColors] 고정된 색상 값을 정의하는 역할
class AppColors {
  static const Color primarySeed = Color(0xFF000000); // 원래 정의된 색상 유지
  static const Color primaryVariant = Color(0xFF008B8B); // 원래 정의된 색상 유지
  static const Color secondary = Color(0xFF80CBC4); // 원래 정의된 색상 유지
  static const Color secondaryVariant = Color(0xFF00695C); // 원래 정의된 색상 유지

  // LightMode
  static const Color background = Color(0xFFF7F7F7); // scaffoldBackground 색상
  static const Color cardColor = Color(0xFFFFFFFF); // card 색상
  static const Color searchBarColor = Color(0xFFEEEFF3); // searchBar 색상
  static const Color buttonColor = Color(0xFFE9F0FD); // button 색상
  static const Color buttonIconColor = Color(0xFF4478E3); // button icon 색상

  // DarkMode
  static const Color backgroundDark = Color(0xFF303030); // scaffoldBackground 색상
  static const Color cardColorDark = Color(0xFF3A3A3A); // card 색상
  static const Color searchBarColorDark = Color(0xFF202020); // searchBar 색상
  static const Color buttonColorDark = Color(0xFF3D80DE); // button 색상
  static const Color buttonIconColorDark = Color(0xFFC5D9F4); // button icon 색상

  // 원래 정의된 색상 유지
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onError = Color(0xFFFFFFFF);
}
