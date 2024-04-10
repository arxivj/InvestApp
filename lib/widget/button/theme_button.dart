import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import '../../main.dart';
import '../../utils/rive_utils.dart';

Widget ThemeButton(BuildContext context) {
  return ValueListenableBuilder<ThemeMode>(
    valueListenable: MyApp.themeNotifier,
    builder: (_, currentThemeMode, __) {
      return GestureDetector(
        onTap: () {
          MyApp.themeNotifier.value = currentThemeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
        },
        child: Container(
          height: 56.h,
          child: RiveAnimation.asset(
            'assets/icons/switch.riv',
            onInit: (artboard) {
              final controller = RiveUtils.getRiveController(artboard, stateMachineName: 'Button_Animation');
              artboard.addController(controller);
              RiveUtils.triggerInput(controller, currentThemeMode == ThemeMode.light ? 'Day/Night_Click' : 'Night/Day_Click');
            },
            animations: ['idle'],
          ),
        ),
      );
    },
  );
}
