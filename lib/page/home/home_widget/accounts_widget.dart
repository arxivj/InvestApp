import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/constants/app_padding.dart';
import 'package:untitled/page/home/home_widget/account_detail_card.dart';
import 'package:untitled/widget/card/card_layout.dart';

class AccountsWidget extends StatelessWidget {
  const AccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: AppPadding.horizontal16,
              child: AccountDetailsCard(),
            ),
            SizedBox(height: 32.h),
            const ActionItemsSection(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}



class ActionItemsSection extends StatelessWidget {
  const ActionItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: CardLayout(
        title: Text(
          'Actions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(14),
            ),
            // Add more content or image as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        child: Icon(
                          Icons.sell_outlined,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jiuzi Holdings Inc',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          'For no reason',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '-20,000원',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    Text(
                      'Shit',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
