import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constants/app_padding.dart';
import 'package:untitled/page/search_bar_widget.dart';
import 'package:untitled/page/stockDetail/stock_detail_page.dart';
import 'package:untitled/page/tabbar.dart';
import '../widget/button/theme_button.dart';
import '../widget/stock_marqee.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StockDetailPage()),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.prefixIconColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          flexibleSpace: const Center(child: ThemeButton()),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 24,
              color: Theme.of(context).inputDecorationTheme.prefixIconColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              iconSize: 24,
              color: Theme.of(context).inputDecorationTheme.prefixIconColor,
            ),
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
        bottomSheet: const StockMarquee(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: AppPadding.horizontal16,
                  child: const SearchBarWidget()),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: AppPadding.horizontal16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      width: 1.sw,
                      height: 0.4.sh,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: AppPadding.horizontal16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      width: 1.sw,
                      height: 0.2.sh,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: AppPadding.horizontal16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      width: 1.sw,
                      height: 0.3.sh,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
