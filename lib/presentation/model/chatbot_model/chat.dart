class Chat {
  final List<Conversation>? conversation;

  Chat({
    this.conversation,
  });

  Chat.fromJson(Map<String, dynamic> json)
      : conversation = (json['conversation'] as List?)
            ?.map(
                (dynamic e) => Conversation.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'conversation': conversation?.map((e) => e.toJson()).toList()};
}

class Conversation {
  final String? role;
  final String? content;

  Conversation({
    this.role,
    this.content,
  });

  Conversation.fromJson(Map<String, dynamic> json)
      : role = json['role'] as String?,
        content = json['content'] as String?;

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}
