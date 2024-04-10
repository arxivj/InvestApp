import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../main.dart';

class StockMarquee extends StatelessWidget {
  const StockMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MyApp.themeNotifier,
      builder: (_, currentThemeMode, __) {
        return Container(
          padding: EdgeInsets.only(top: 4),
          color: MyApp.themeNotifier.value == ThemeMode.light
              ? Color(0x3A30D5C8)
              : Colors.black,
          height: 32,
          width: double.infinity,
          child: Marquee(
            text: 'Nasdaq 12345 - S&P500 678910 - KOSPI 00000',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 60.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        );
      },
    );
  }
}
