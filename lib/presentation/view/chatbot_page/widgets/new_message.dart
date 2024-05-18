import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/controllers/chatbot_controller/chatbot_API_controller.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, this.controller, this.onSubmitted});
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  late TextEditingController _messageController;
  var chatbot = Get.find<ChatBotAPIController>();
  @override
  void initState() {
    super.initState();
    _messageController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    // Call the onSubmitted callback if it's provided
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(enteredMessage);
    }

    final response = await chatbot.chatBotAPI(enteredMessage);

    response.fold(
      (failure) {
        // Handle error here
        print('Error: ${failure.message}');
      },
      (chatBotResponse) {   
        // Handle success here
        print('Message: $enteredMessage');
        print('Response : ' + "${chatbot.chatbotReponse.value?.message}");
      },   
    );

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                _submitMessage();
              },
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(
                focusColor: MyColors.primaryGreen,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryGreen),
                ),
                labelText: 'Send a message...',
                labelStyle: TextStyle(
                  color: MyColors.primaryGreen, // Custom label text color
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            icon: const Icon(Icons.send),
            color: MyColors.primaryGreen,
          ),
        ],
      ),
    );
  }
}
