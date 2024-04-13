import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  Widget _buildItem(BuildContext context, int index) {
    if (index.isEven) {
      String title = "Section $index";
      String content = "Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software, and online services. Content for section $index. This is a placeholder.";

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Divider(
          height: 6,
          thickness: 6,
          color: Color(0xFFEEEEEE),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 56.h),
        Expanded(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => _buildItem(context, index),
          ),
        ),
      ],
    );
  }
}
