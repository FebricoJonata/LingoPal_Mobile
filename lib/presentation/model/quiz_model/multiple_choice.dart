class MultipleChoiceData {
  final int? status;
  final List<Body>? body;

  MultipleChoiceData({
    this.status,
    this.body,
  });

  MultipleChoiceData.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.map((e) => e.toJson()).toList()};
}

class Body {
  final int? quizId;
  final String? question;
  final String? answerKey;
  final List<String>? choices;
  final int? practiceId;

  Body({
    this.quizId,
    this.question,
    this.answerKey,
    this.choices,
    this.practiceId,
  });

  Body.fromJson(Map<String, dynamic> json)
      : quizId = json['quiz_id'] as int?,
        question = json['question'] as String?,
        answerKey = json['answer_key'] as String?,
        choices = (json['choices'] as List?)?.map((dynamic e) => e as String).toList(),
        practiceId = json['practice_id'] as int?;

  Map<String, dynamic> toJson() =>
      {'quiz_id': quizId, 'question': question, 'answer_key': answerKey, 'choices': choices, 'practice_id': practiceId};
}
