// // ignore_for_file: invalid_use_of_protected_member

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';
import 'package:lingo_pal_mobile/core/image/image_const.dart';
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
  TextEditingController _messageController = TextEditingController();
  var _chatbot = Get.find<ChatBotAPIController>();
  var _controllerTTS = Get.find<AudioController>();
  var _controller = Get.find<ChatController>();
  ScrollController scrollController = ScrollController();

  Future<void> handleSubmittedMessage(String message) async {
    if (message.isNotEmpty) {
      if (message.trim().isEmpty) {
        return;
      }
      _controller.addMessage(message, true);
      final response = await _chatbot.chatBotAPI(message);

      response.fold(
        (failure) {
          // Handle error here
          print('Error: ${failure.message}');
        },
        (chatBotResponse) {
          _controller.addMessage(_chatbot.chatbotReponse.value?.message ?? "", false);

          scrollToBottom(); // Scroll ke bawah setelah menerima respons
        },
      );

      _messageController.clear();
      _chatbot.update();
    }
    _controller.update();
    scrollToBottom(); // Scroll ke bawah setelah mengirim pesan
  }

  // Method untuk scroll otomatis ke chat terbaru
  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: 1179.w,
          height: 2556.h,
          color: MyColors.secondaryYellow,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AssetConstraints.bgIntroTop),
                SizedBox(
                  width: 1179.w,
                  height: 1600.h,
                  child: GetBuilder<ChatController>(
                    builder: (controller) {
                      if (controller.messages.isEmpty) {
                        // use rich text
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(text: 'welcome_chat'.tr, style: DefaultTextStyle.of(context).style, children: [
                                TextSpan(text: 'type'.tr),
                                const TextSpan(text: 'Hello, Lingo', style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                                TextSpan(text: 'start_chat_rule'.tr),
                                TextSpan(text: 'rate_chat_rule'.tr),
                                const TextSpan(text: 'Rate my English', style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                                const TextSpan(text: ".\n"),
                                TextSpan(text: 'disclaimer'.tr)
                              ])),
                        );
                        // return const Text("Welcome to the chatroom with our AI bot, Lingo.\nLet's start chatting and learning with English together!", textAlign: TextAlign.center,);
                      }
                      return ListView.builder(
                        controller: scrollController, // Tambahkan controller di sini
                        shrinkWrap: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          Message message = controller.messages[index];
                          if (message.isFromUser) {
                            return MessageBubble.next(
                              message: message.text,
                              isMe: true,
                              isLoading: false,
                            );
                          } else {
                            return Obx(() => MessageBubble.first(
                                  isLoading: _chatbot.isLoading.value,
                                  userImage: AssetConstraints.robotCool,
                                  username: "Lingo",
                                  message: message.text,
                                  isMe: false,
                                  onSpeechPressed: () async {
                                    _controllerTTS.fetchAudioFromApi(controller.messages[index].text);
                                  },
                                  isLastMessage: true,
                                ));
                          }
                        },
                      );
                    },
                  ),
                ),
                NewMessage(
                  controller: _messageController,
                  onSubmitted: (value) async {
                    String message = _messageController.text;
                    await handleSubmittedMessage(message);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
