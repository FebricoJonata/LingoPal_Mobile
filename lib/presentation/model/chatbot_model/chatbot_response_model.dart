class ChatBotResponse {
  final String? message;

  ChatBotResponse({
    this.message,
  });

  ChatBotResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'message': message};
}
