import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chat_user_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chatbot_API_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/tts_controller.dart';

class ChatBotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatBotAPIController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => AudioController());
  }
}
