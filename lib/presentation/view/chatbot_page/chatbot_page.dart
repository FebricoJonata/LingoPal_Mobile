import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.secondaryYellow,
      ),
    );
  }
}
