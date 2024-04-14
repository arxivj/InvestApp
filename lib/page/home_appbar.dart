import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_padding.dart';
import 'package:untitled/page/stockDetail/stock_detail_page.dart';
import 'package:untitled/widget/button/theme_button.dart';

PreferredSizeWidget homeAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 56,
    titleSpacing: -30,
    centerTitle: false,
    flexibleSpace: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StockDetailPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: Colors.transparent,
            //       shape: BoxShape.rectangle,
            //     ),
            //   ),
            // ),
            ThemeButton(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bar_chart),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
  );
}
