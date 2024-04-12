import 'package:flutter/material.dart';
import 'package:untitled/page/tabbar/accounts_widget.dart';

class HomeTabBarWidget extends StatefulWidget {
  const HomeTabBarWidget({super.key});

  @override
  State<HomeTabBarWidget> createState() => _HomeTabBarWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _HomeTabBarWidgetState extends State<HomeTabBarWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          enableFeedback: true,
          isScrollable: true,
          indicatorWeight: 3.0,
          indicatorSize: TabBarIndicatorSize.values[0],
          unselectedLabelStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelColor: Colors.teal.shade700,
          tabs: const <Widget>[
            Tab(
              text: "Accounts",
            ),
            Tab(
              text: "Cards",
            ),
            Tab(
              text: "Linked",
            ),
            Tab(
              text: "Stocks",
            ),
            Tab(
              text: "News",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: AccountsWidget(),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
