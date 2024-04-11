import 'package:flutter/material.dart';
import '../widget/button/theme_button.dart';
import '../widget/stock_marqee.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: const _CustomFabLocation(
          FloatingActionButtonLocation.endFloat,
          -30.0,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        elevation: 0,
        focusNode: FocusNode(),
        focusElevation: 0,
      ),
        bottomSheet: const StockMarquee(),
        body: Column(
          children: <Widget>[
            ThemeButton(),
            const SizedBox(height: 250),
          ],
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