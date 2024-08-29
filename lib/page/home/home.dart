import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_padding.dart';
import 'package:untitled/page/home/custom_tab_bar_delegate.dart';
import 'package:untitled/page/home/home_appbar.dart';
import 'package:untitled/page/home/search_bar_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const HomeAppBar(),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: AppPadding.horizontal16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      SearchBarWidget(),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomTabBarDelegate(),
              ),
            ];
          },
          body: customTabBarView(),
        ),
      ),
    );
  }
}

class CustomFabLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation location;
  final double offsetY;

  const CustomFabLocation(this.location, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx, offset.dy + offsetY);
  }
}
