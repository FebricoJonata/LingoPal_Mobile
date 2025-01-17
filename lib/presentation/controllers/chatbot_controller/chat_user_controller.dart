import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/model/chatbot_model/chat_user_model.dart';

class ChatController extends GetxController {
  final _messages = <Message>[].obs;
  List<Message> get messages => _messages;

  void addMessage(String text, bool isFromUser) {
    _messages.add(Message(text: text, isFromUser: isFromUser));
  }
}
