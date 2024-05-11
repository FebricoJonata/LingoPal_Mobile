import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/message_bubble.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/new_message.dart';

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
          width: 1179.w,
          height: 2556.h,
          color: MyColors.secondaryYellow,
          child: Column(
            children: [
              Image.asset(AssetConstraints.bgIntroTop),
              Container(
                width: 1179.w,
                height: 1600.h,
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    const MessageBubble.first(
                        userImage:
                            "https://vfsijkhnwxfbsanoefua.supabase.co/storage/v1/object/public/lingo-pal-storage/profiles/kao.jpeg",
                        username: "Fabian Ganteng",
                        message: "Yes",
                        isMe: false),
                    MessageBubble.next(message: "Yes", isMe: true),
                  ],
                ),
              ),
              NewMessage()
              // Align(alignment: Alignment.bottomCenter, child: )
            ],
          )),
    );
  }
}
