import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../provider/theme_provider.dart';
import '../../utils/rive_utils.dart';

Widget ThemeButton() {
  return Builder(
    builder: (context) {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      String initialAnimation = '';
      bool isClickable = true;
      return GestureDetector(
        onTap: () {
          if (isClickable) {
            final newThemeMode = themeProvider.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            themeProvider.setThemeMode(newThemeMode);

            isClickable = false;
            Timer(const Duration(milliseconds: 2000), () {
              isClickable = true;
            });
          }
        },
        child: SizedBox(
          height: 80.h,
          child: RiveAnimation.asset(
            'assets/icons/switch.riv',
            onInit: (artboard) {
              final controller = RiveUtils.getRiveController(artboard, stateMachineName: 'Button_Animation');
              artboard.addController(controller);
              if (!themeProvider.isInitialLoad) {
                RiveUtils.triggerInput(controller, initialAnimation);
              }
            },
            animations: [initialAnimation],
          ),
        ),
      );
    },
  );
}