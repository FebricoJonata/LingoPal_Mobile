import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chat_user_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/chat_user_model.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/message_bubble.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/new_message.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  var controller = Get.find<ChatController>();
  TextEditingController textEditingController = TextEditingController();
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
              // SingleChildScrollView(
              SizedBox(
                width: 1179.w,
                height: 1600.h,
                // child: Column(
                //   children: [
                child: GetBuilder<ChatController>(
                  // init: MyController(),
                  // initState: (_) {},
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true, // Ini penting untuk mencegah konflik ukuran
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        Message message = controller.messages[index];
                        if (message.isFromUser) {
                          return MessageBubble.next(message: message.text, isMe: true);
                        } else {
                          return MessageBubble.first(
                              userImage: AssetConstraints.robotCool,
                              username: "Lingo",
                              message: message.text,
                              isMe: false);
                        }
                        // return ListTile(
                        //   title: Text(message.text),
                        //   subtitle: Text(message.isFromUser ? 'You' : 'Other'),
                        // );
                      },
                    );
                  },
                ),
                // ],
                // ),
              ),

              // ),
              NewMessage(
                controller: textEditingController,
                onSubmitted: (value) {
                  String message = textEditingController.text;
                  if (message.isNotEmpty) {
                    controller.addMessage(message, true); // Message from user
                    textEditingController.clear();
                    // Simulate receiving a message from the other party
                    Future.delayed(Duration(milliseconds: 100), () {
                      controller.addMessage('Hello from the other side', false);
                    });
                  }
                  controller.update();
                },
              )
              // Align(alignment: Alignment.bottomCenter, child: )
            ],
          )),
    );
  }
}
