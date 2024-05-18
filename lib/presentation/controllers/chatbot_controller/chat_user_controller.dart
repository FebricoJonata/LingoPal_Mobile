import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/chat_user_model.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;

  void addMessage(String text, bool isFromUser) {
    messages.add(Message(text: text, isFromUser: isFromUser));
  }
}
