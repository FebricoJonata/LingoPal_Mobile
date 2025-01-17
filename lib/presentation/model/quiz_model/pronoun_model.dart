// class SpeechToText {
//   final int? status;
//   final Body? body;

//   SpeechToText({
//     this.status,
//     this.body,
//   });

//   SpeechToText.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as int?,
//         body = (json['body'] as Map<String, dynamic>?) != null ? Body.fromJson(json['body'] as Map<String, dynamic>) : null;

//   Map<String, dynamic> toJson() => {'status': status, 'body': body?.toJson()};
// }

// class Body {
//   final String? text;
//   final PronunciationScores? pronunciationScores;

//   Body({
//     this.text,
//     this.pronunciationScores,
//   });

//   Body.fromJson(Map<String, dynamic> json)
//       : text = json['text'] as String?,
//         pronunciationScores = (json['pronunciationScores'] as Map<String, dynamic>?) != null ? PronunciationScores.fromJson(json['pronunciationScores'] as Map<String, dynamic>) : null;

//   Map<String, dynamic> toJson() => {'text': text, 'pronunciationScores': pronunciationScores?.toJson()};
// }

// class PronunciationScores {
//   final int? accuracyScore;
//   final double? pronunciationScore;
//   final int? completenessScore;
//   final int? fluencyScore;

//   PronunciationScores({
//     this.accuracyScore,
//     this.pronunciationScore,
//     this.completenessScore,
//     this.fluencyScore,
//   });

//   PronunciationScores.fromJson(Map<String, dynamic> json)
//       : accuracyScore = json['accuracyScore'] as int?,
//         pronunciationScore = json['pronunciationScore'] as double?,
//         completenessScore = json['completenessScore'] as int?,
//         fluencyScore = json['fluencyScore'] as int?;

//   Map<String, dynamic> toJson() => {'accuracyScore': accuracyScore, 'pronunciationScore': pronunciationScore, 'completenessScore': completenessScore, 'fluencyScore': fluencyScore};
// }
class SpeechToText {
  final int? _status;
  final Body? _body;

  SpeechToText({
    int? status,
    Body? body,
  })  : _status = status,
        _body = body;

  SpeechToText.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as Map<String, dynamic>?) != null ? Body.fromJson(json['body'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.toJson(),
      };

  int? get status => _status;
  Body? get body => _body;
}

class Body {
  final String? _text;
  final PronunciationScores? _pronunciationScores;

  Body({
    String? text,
    PronunciationScores? pronunciationScores,
  })  : _text = text,
        _pronunciationScores = pronunciationScores;

  Body.fromJson(Map<String, dynamic> json)
      : _text = json['text'] as String?,
        _pronunciationScores = (json['pronunciationScores'] as Map<String, dynamic>?) != null ? PronunciationScores.fromJson(json['pronunciationScores'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'text': _text,
        'pronunciationScores': _pronunciationScores?.toJson(),
      };

  String? get text => _text;
  PronunciationScores? get pronunciationScores => _pronunciationScores;
}

class PronunciationScores {
  final int? _accuracyScore;
  final double? _pronunciationScore;
  final int? _completenessScore;
  final int? _fluencyScore;

  PronunciationScores({
    int? accuracyScore,
    double? pronunciationScore,
    int? completenessScore,
    int? fluencyScore,
  })  : _accuracyScore = accuracyScore,
        _pronunciationScore = pronunciationScore,
        _completenessScore = completenessScore,
        _fluencyScore = fluencyScore;

  PronunciationScores.fromJson(Map<String, dynamic> json)
      : _accuracyScore = json['accuracyScore'] as int?,
        _pronunciationScore = json['pronunciationScore'] as double?,
        _completenessScore = json['completenessScore'] as int?,
        _fluencyScore = json['fluencyScore'] as int?;

  Map<String, dynamic> toJson() => {
        'accuracyScore': _accuracyScore,
        'pronunciationScore': _pronunciationScore,
        'completenessScore': _completenessScore,
        'fluencyScore': _fluencyScore,
      };

  int? get accuracyScore => _accuracyScore;
  double? get pronunciationScore => _pronunciationScore;
  int? get completenessScore => _completenessScore;
  int? get fluencyScore => _fluencyScore;
}
