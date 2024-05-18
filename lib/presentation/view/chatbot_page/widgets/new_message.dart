import 'package:flutter/material.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, this.controller, this.onSubmitted});
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 15),
      child: Row(children: [
        Expanded(
          child: TextField(
            onSubmitted: widget.onSubmitted,
            controller: widget.controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: const InputDecoration(
              focusColor: MyColors.primaryGreen,
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.primaryGreen)),
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
        )
      ]),
    );
  }
}
