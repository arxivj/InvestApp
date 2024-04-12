import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.4.sw,
      height: 0.2.sh,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 0.1.sw,
              height: 0.1.sw,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 0.2.sw,
              height: 0.02.sh,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 0.3.sw,
              height: 0.02.sh,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
