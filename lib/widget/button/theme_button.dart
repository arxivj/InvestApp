import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../provider/theme_provider.dart';
import '../../utils/rive_utils.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isClickable = true;
  late StateMachineController _controller;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      width: 144,
      height: 40,
      child: GestureDetector(
        onTap: () {
          if (isClickable) {
            final newThemeMode = themeProvider.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            themeProvider.setThemeMode(newThemeMode, isUserInitiated: true);

            // Trigger animation input based on the new theme mode
            RiveUtils.triggerInput(_controller, newThemeMode == ThemeMode.dark ? 'ActivateDarkMode' : 'ActivateLightMode');

            setState(() {
              isClickable = false;
            });

            Timer(const Duration(seconds: 2), () {
              setState(() {
                isClickable = true;
              });
            });
          }
        },
        child: RiveAnimation.asset(
          'assets/icons/theme_switch.riv',
          fit: BoxFit.cover,
          onInit: (artboard) {
            _controller = RiveUtils.getRiveController(artboard, stateMachineName: 'Button_Animation');
            artboard.addController(_controller);
            // Trigger initial animation based on current theme mode when the artboard is initialized
            RiveUtils.triggerInput(_controller, themeProvider.themeMode == ThemeMode.dark ? 'ActivateDarkMode' : 'ActivateLightMode');
          },
          // Ensure this matches actual input names in your Rive file
        ),
      ),
    );
  }
}
