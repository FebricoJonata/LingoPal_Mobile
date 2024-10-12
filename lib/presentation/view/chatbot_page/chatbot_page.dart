// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chat_user_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chatbot_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/chat_user_model.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/message_bubble.dart';
import 'package:lingo_pal_mobile/presentation/view/chatbot_page/widgets/new_message.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController messageController = TextEditingController();
  var chatbot = Get.find<ChatBotAPIController>();
  var controllerTTS = Get.find<AudioController>();

  Future<void> handleSubmittedMessage(String message) async {
    if (message.isNotEmpty) {
      if (message.trim().isEmpty) {
        return;
      }
      controller.addMessage(message, true);
      final response = await chatbot.chatBotAPI(message);

      response.fold(
        (failure) {
          // Handle error here
          print('Error: ${failure.message}');
        },
        (chatBotResponse) {
          // Handle success here
          controller.update();
          print('Message: $message');
          controller.addMessage(chatbot.chatbotReponse.value?.message ?? "", false);
          print('Response : ${chatbot.chatbotReponse.value?.message}');
        },
      );

      messageController.clear();
      chatbot.update();
      messageController.clear();
    }
    controller.update();
  }

  var controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: 1179.w,
          height: 2556.h,
          color: MyColors.secondaryYellow,
          child: SingleChildScrollView(
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
                              isMe: false,
                              onSpeechPressed: () async {
                                controllerTTS.fetchAudioFromApi(controller.messages.value[index].text);
                              },
                              isLastMessage: true,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                NewMessage(
                  controller: messageController,
                  onSubmitted: (value) async {
                    String message = messageController.text;
                    await handleSubmittedMessage(message);
                  },
                )
              ],
            ),
          )),
    );
  }
}
