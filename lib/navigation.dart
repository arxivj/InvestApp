import 'package:flutter/material.dart';
import 'package:untitled/page/chat.dart';
import 'package:untitled/page/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:untitled/utils/rive_utils.dart';

class IconController {
  late final SMIBool trigger;

  IconController(Artboard artboard, String stateMachineName, String inputName) {
    var controller = RiveUtils.getRiveController(artboard,
        stateMachineName: stateMachineName);
    trigger = controller.findSMI(inputName) as SMIBool;
  }

  void setActive(bool isActive) {
    trigger.value = isActive;
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  final Map<int, IconController> iconControllers = {};

  String getRiveFile(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return themeMode == Brightness.dark
        ? "assets/icons/icons_dark.riv"
        : "assets/icons/icons_light.riv";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        height: 56.h,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
            iconControllers.forEach((iconIndex, controller) {
              controller.setActive(iconIndex == index);
            });
          });
        },
        destinations: List.generate(
            5,
            (index) => NavigationDestination(
                  icon: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: RiveAnimation.asset(
                      getRiveFile(context),
                      artboard: [
                        "HOME",
                        "LIKE/STAR",
                        "USER",
                        "CHAT",
                        "SETTINGS"
                      ][index],
                      onInit: (artboard) {
                        iconControllers[index] = IconController(
                          artboard,
                          [
                            "HOME_interactivity",
                            "STAR_Interactivity",
                            "USER_Interactivity",
                            "CHAT_Interactivity",
                            "SETTINGS_Interactivity"
                          ][index],
                          "active",
                        );
                        iconControllers[index]
                            ?.setActive(index == selectedIndex);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  label: [
                    "Home",
                    "LIKE",
                    "Untitled",
                    "Limited",
                    "Settings"
                  ][index],
                )),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            Center(child: Home()),
            Center(child: Text("Search")),
            Center(child: Text("Favorite")),
            Center(child: Chat()),
            Center(child: Text("Settings")),
          ],
        ),
      ),
    );
  }
}
