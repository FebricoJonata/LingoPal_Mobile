class MultipleChoiceData {
  final int? status;
  final List<Data>? data;

  MultipleChoiceData({
    this.status,
    this.data,
  });

  MultipleChoiceData.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'status': status, 'data': data?.map((e) => e.toJson()).toList()};
}

class Data {
  final int? quizId;
  final String? question;
  final String? answerKey;
  final List<String>? choices;
  final int? practiceId;

  Data({
    this.quizId,
    this.question,
    this.answerKey,
    this.choices,
    this.practiceId,
  });

  Data.fromJson(Map<String, dynamic> json)
      : quizId = json['quiz_id'] as int?,
        question = json['question'] as String?,
        answerKey = json['answer_key'] as String?,
        choices = (json['choices'] as List?)?.map((dynamic e) => e as String).toList(),
        practiceId = json['practice_id'] as int?;

  Map<String, dynamic> toJson() => {'quiz_id': quizId, 'question': question, 'answer_key': answerKey, 'choices': choices, 'practice_id': practiceId};
}
