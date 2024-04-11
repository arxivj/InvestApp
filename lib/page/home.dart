import 'package:flutter/material.dart';
import '../widget/button/theme_button.dart';
import '../widget/stock_marqee.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ThemeButton(),
        const SizedBox(height: 250),
        const StockMarquee()
      ],
    ));
  }
}
