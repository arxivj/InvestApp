import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'navigation.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: const Size(400, 800),
      enabled: MediaQuery.sizeOf(context).shortestSide > 600,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => const Scaffold(
          body: Navigation(),
        ),
      ),
    );
  }
}
