import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_padding.dart';

class AccountsWidget extends StatelessWidget {
  const AccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: AppPadding.horizontal16,
              child: AccountDetailsCard(),
            ),
            SizedBox(height: 32.h),
            ActionItemsSection(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class AccountDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('12345678-01 위탁계좌',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).hintColor,
                      fontSize: 11.sp)),
              Container(
                padding: EdgeInsets.only(left: 4.sp),
                child: Icon(
                  Icons.copy,
                  color: Theme.of(context).hintColor,
                  size: 14.sp,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                '14,000,000원',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(4.sp),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).highlightColor,
                      size: 16.sp,
                    ),
                  )),
            ],
          ),
          Text('Korea Won (KRW)',
              style: TextStyle(
                fontSize: 11.sp,
                color: Theme.of(context).hintColor,
              )),
          // const SizedBox(height: 8),
          // Text(
          //   '-2,046원 | -5.17%',
          //   style: Theme.of(context).textTheme.subtitle1?.copyWith(
          //     color: Colors.red,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // AccountDataRow('예수금', '1,363원'),
          // AccountDataRow('매입금액', '39,547원'),
          // AccountDataRow('평가금액', '37,501원'),
          // AccountDataRow('손익금액', '-2,046원'),
          // AccountDataRow('출금가능금액', '0원'),
          const SizedBox(height: 16),
          ActionButtonsBar(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AccountDataRow extends StatelessWidget {
  final String label;
  final String value;

  AccountDataRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class ActionButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(title: '거래내역', icon: Icons.swap_horiz),
          // Choose appropriate icons
          ActionButton(title: '이체', icon: Icons.compare_arrows),
          ActionButton(title: '채우기', icon: Icons.add_circle_outline),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  ActionButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(15.sp),
            // Adjust padding to scale the circular button
            shape: CircleBorder(),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).highlightColor,
            size: 24.sp, // Adjust icon size to fit within the button
          ),
        ),
        SizedBox(height: 4.h), // Spacing between icon and text
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).highlightColor,
          ),
        ),
      ],
    );
  }
}

class ActionItemsSection extends StatelessWidget {
  const ActionItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Actions',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
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
                    )
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
