import 'package:flutter/material.dart';
import 'package:untitled/provider/theme_provider.dart';

import 'accounts_widget.dart';

class CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        isScrollable: true,
        tabs: _buildTabs(context),
        indicatorWeight: 0,
        unselectedLabelColor: const Color(0xFF7A7E89),
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  bool shouldRebuild(CustomTabBarDelegate oldDelegate) => false;

  List<Widget> _buildTabs(BuildContext context) {
    List<String> tabTitles = [
      "Accounts",
      "Stocks",
      "News",
      "Untitled",
      "Untitled"
    ];
    return tabTitles
        .map((title) => Tab(child: _buildTabContent(context, title)))
        .toList();
  }

  Widget _buildTabContent(BuildContext context, String title) {
    Color fontColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: fontColor,
        ),
      ),
    );
  }
}

// 홈에서 탭바를 선택시 나타날 위젯 세팅 (home - body에서 사용 중)
Widget customTabBarView() {
  return TabBarView(
    children: [
      const AccountsWidget(),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
      Container(color: Colors.orange),
    ],
  );
}
