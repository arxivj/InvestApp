import 'package:flutter/material.dart';
import 'package:untitled/page/stockDetail/stock_detail_page.dart';
import 'package:untitled/widget/button/theme_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StockDetailPage(),
            ),
          );
        },
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person),
        ),
      ),
      title: const ThemeButton(),
      actions: [
        IconButton(
          icon: const Icon(Icons.bar_chart),
          onPressed: () {},
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          splashRadius: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
