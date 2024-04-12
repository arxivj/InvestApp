import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/page/tabbar.dart';
import '../based_stateless_page.dart';
import '../widget/button/theme_button.dart';
import '../widget/stock_marqee.dart';

class Home extends BaseStatelessWidget {
  const Home({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    Color iconColor =
        themeMode == Brightness.dark ? Colors.white : Colors.grey.shade500;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
          leading: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.bar_chart_outlined),
                iconSize: 24,
                color: iconColor),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                iconSize: 24,
                color: iconColor),
          ],
        ),
        floatingActionButtonLocation: const _CustomFabLocation(
          FloatingActionButtonLocation.endFloat,
          -30.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          focusNode: FocusNode(),
          focusElevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        // bottomSheet: const StockMarquee(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ThemeButton(),
              Container(
                width: 1.sw,
                height: 1.sh,
                padding: const EdgeInsets.all(16),
                child: const HomeTabBarWidget()
              ),
            ],
          ),
        )
    );
  }
}

/// [FloatingActionButtonLocation] Floating Action Button의 위치를 조절하기 위한 커스텀 유틸 위젯임
class _CustomFabLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation location;
  final double offsetY;

  const _CustomFabLocation(this.location, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx, offset.dy + offsetY);
  }
}
