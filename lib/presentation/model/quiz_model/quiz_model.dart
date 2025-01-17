// class QuizModel {
//   final int? status;
//   final List<Quiz>? data;

//   QuizModel({
//     this.status,
//     this.data,
//   });

//   QuizModel.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as int?,
//         data = (json['data'] as List?)?.map((dynamic e) => Quiz.fromJson(e as Map<String, dynamic>)).toList();

//   Map<String, dynamic> toJson() => {'status': status, 'data': data?.map((e) => e.toJson()).toList()};
// }

// class Quiz {
//   final int? quizId;
//   final String? question;
//   final String? answerKey;
//   final List<String>? choices;
//   final int? practiceId;

//   Quiz({
//     this.quizId,
//     this.question,
//     this.answerKey,
//     this.choices,
//     this.practiceId,
//   });

//   Quiz.fromJson(Map<String, dynamic> json)
//       : quizId = json['quiz_id'] as int?,
//         question = json['question'] as String?,
//         answerKey = json['answer_key'] as String?,
//         choices = (json['choices'] as List?)?.map((dynamic e) => e as String).toList(),
//         practiceId = json['practice_id'] as int?;

//   Map<String, dynamic> toJson() => {'quiz_id': quizId, 'question': question, 'answer_key': answerKey, 'choices': choices, 'practice_id': practiceId};
// }
class QuizModel {
  final int? _status;
  final List<Quiz>? _data;

  QuizModel({
    int? status,
    List<Quiz>? data,
  })  : _status = status,
        _data = data;

  QuizModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _data = (json['data'] as List?)?.map((dynamic e) => Quiz.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'data': _data?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<Quiz>? get data => _data;
}

class Quiz {
  final int? _quizId;
  final String? _question;
  final String? _answerKey;
  final List<String>? _choices;
  final int? _practiceId;

  Quiz({
    int? quizId,
    String? question,
    String? answerKey,
    List<String>? choices,
    int? practiceId,
  })  : _quizId = quizId,
        _question = question,
        _answerKey = answerKey,
        _choices = choices,
        _practiceId = practiceId;

  Quiz.fromJson(Map<String, dynamic> json)
      : _quizId = json['quiz_id'] as int?,
        _question = json['question'] as String?,
        _answerKey = json['answer_key'] as String?,
        _choices = (json['choices'] as List?)?.map((dynamic e) => e as String).toList(),
        _practiceId = json['practice_id'] as int?;

  Map<String, dynamic> toJson() => {
        'quiz_id': _quizId,
        'question': _question,
        'answer_key': _answerKey,
        'choices': _choices,
        'practice_id': _practiceId,
      };

  int? get quizId => _quizId;
  String? get question => _question;
  String? get answerKey => _answerKey;
  List<String>? get choices => _choices;
  int? get practiceId => _practiceId;
}
