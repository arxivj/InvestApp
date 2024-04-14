import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_padding.dart';
import 'grid_item_widget.dart';

class AccountsWidget extends StatelessWidget {
  const AccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.h),
            ),
            // GridItemWidget(),
            Padding(
              padding: AppPadding.horizontal16,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(14),
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
                      borderRadius: BorderRadius.circular(14),
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
                      borderRadius: BorderRadius.circular(14),
                    ),
                    width: 1.sw,
                    height: 0.3.sh,
                  ),
                ],
              ),
            ),
            // Flexible(
            //   flex: 1,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(14),
            //       ),
            //       color: Colors.grey.shade900,
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Accounts',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40.h)
          ],
        ),
      ),
    );
  }
}
