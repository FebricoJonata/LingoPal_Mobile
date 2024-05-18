import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chatbot_API_controller.dart';

class ChatBotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatBotAPIController());
  }
}
