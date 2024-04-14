import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chat'),
          SizedBox(height: 20),
          Text('그냥 커뮤니티 탭으로 할까', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
