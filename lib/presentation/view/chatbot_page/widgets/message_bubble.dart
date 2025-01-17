import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_const.dart';

// A MessageBubble for showing a single chat message on the ChatScreen.
class MessageBubble extends StatelessWidget {
  // Create a message bubble which is meant to be the first in the sequence.
  const MessageBubble.first(
      {super.key, required this.userImage, required this.username, required this.message, required this.isMe, required this.onSpeechPressed, required this.isLastMessage, required this.isLoading})
      : isFirstInSequence = true;

  // Create a amessage bubble that continues the sequence.
  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
    required this.isLoading,
  })  : isFirstInSequence = false,
        userImage = null,
        username = null,
        onSpeechPressed = null,
        isLastMessage = false;

  // Whether or not this message bubble is the first in a sequence of messages
  // from the same user.
  // Modifies the message bubble slightly for these different cases - only
  // shows user image for the first message from the same user, and changes
  // the shape of the bubble for messages thereafter.
  final bool isFirstInSequence;

  // Image of the user to be displayed next to the bubble.
  // Not required if the message is not the first in a sequence.
  final String? userImage;

  // Username of the user.
  // Not required if the message is not the first in a sequence.
  final String? username;
  final String message;

  // Controls how the MessageBubble will be aligned.
  final bool isMe;

  final VoidCallback? onSpeechPressed;
  final bool isLastMessage;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            left: 10,
            // Align user image to the right, if the message is from me.
            right: isMe ? 0 : null,
            child: CircleAvatar(
              backgroundImage: AssetImage(userImage!),
              // NetworkImage(
              //   userImage!,
              // ),
              backgroundColor: MyColors.white,
              radius: 23,
            ),
          ),
        Container(
          // Add some margin to the edges of the messages, to allow space for the
          // user's image.
          margin: !isMe ? const EdgeInsets.symmetric(horizontal: 46) : null,
          child: Row(
            // The side of the chat screen the message should show at.
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // First messages in the sequence provide a visual buffer at
                  // the top.
                  if (isFirstInSequence) const SizedBox(height: 18),
                  if (username != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                      ),
                      child: Row(
                        children: [
                          Text(
                            username!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          if (onSpeechPressed != null && isLastMessage)
                            isLoading == false
                                ? IconButton(
                                    icon: const Icon(Icons.volume_up),
                                    onPressed: onSpeechPressed,
                                    iconSize: 16,
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(left: 30.w),
                                    child: const SizedBox(
                                      width: 16.0, // Sesuaikan ukuran lebar
                                      height: 16.0, // Sesuaikan ukuran tinggi
                                      child: CircularProgressIndicator(
                                        color: MyColors.primaryGreen,
                                        strokeWidth: 2.0, // Menyesuaikan ketebalan
                                      ),
                                    ),
                                  ),
                        ],
                      ),
                    ),

                  // The "speech" box surrounding the message.
                  Container(
                    decoration: BoxDecoration(
                      color: isMe ? MyColors.primaryGreen : MyColors.secondaryGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: !isMe && isFirstInSequence ? Radius.zero : const Radius.circular(12),
                        topRight: isMe && isFirstInSequence ? Radius.zero : const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    // Set some reasonable constraints on the width of the
                    // message bubble so it can adjust to the amount of text
                    // it should show.
                    constraints: const BoxConstraints(maxWidth: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    // Margin around the bubble.
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        // Add a little line spacing to make the text look nicer
                        // when multilined.
                        height: 1.3,
                        color: theme.colorScheme.onSecondary,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
