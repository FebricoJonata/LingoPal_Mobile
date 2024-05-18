class ChatBot {
  final String? message;

  ChatBot({
    this.message,
  });

  ChatBot.fromJson(Map<String, dynamic> json) : message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'message': message};
}
