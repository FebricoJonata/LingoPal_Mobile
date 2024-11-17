class SpeechToText {
  final int? status;
  final Body? body;

  SpeechToText({
    this.status,
    this.body,
  });

  SpeechToText.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as Map<String, dynamic>?) != null ? Body.fromJson(json['body'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.toJson()};
}

class Body {
  final String? text;
  final PronunciationScores? pronunciationScores;

  Body({
    this.text,
    this.pronunciationScores,
  });

  Body.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String?,
        pronunciationScores = (json['pronunciationScores'] as Map<String, dynamic>?) != null ? PronunciationScores.fromJson(json['pronunciationScores'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'text': text, 'pronunciationScores': pronunciationScores?.toJson()};
}

class PronunciationScores {
  final int? accuracyScore;
  final double? pronunciationScore;
  final int? completenessScore;
  final int? fluencyScore;

  PronunciationScores({
    this.accuracyScore,
    this.pronunciationScore,
    this.completenessScore,
    this.fluencyScore,
  });

  PronunciationScores.fromJson(Map<String, dynamic> json)
      : accuracyScore = json['accuracyScore'] as int?,
        pronunciationScore = json['pronunciationScore'] as double?,
        completenessScore = json['completenessScore'] as int?,
        fluencyScore = json['fluencyScore'] as int?;

  Map<String, dynamic> toJson() => {'accuracyScore': accuracyScore, 'pronunciationScore': pronunciationScore, 'completenessScore': completenessScore, 'fluencyScore': fluencyScore};
}
// class PronunciationScores {
//   final double? accuracyScore;
//   final double? pronunciationScore;
//   final double? completenessScore;
//   final double? fluencyScore;

//   PronunciationScores({
//     this.accuracyScore,
//     this.pronunciationScore,
//     this.completenessScore,
//     this.fluencyScore,
//   });

//   PronunciationScores.fromJson(Map<String, dynamic> json)
//       : accuracyScore = _parseToDouble(json['accuracyScore']),
//         pronunciationScore = _parseToDouble(json['pronunciationScore']),
//         completenessScore = _parseToDouble(json['completenessScore']),
//         fluencyScore = _parseToDouble(json['fluencyScore']);

//   // Helper function to ensure the value is parsed as double
//   static double? _parseToDouble(dynamic value) {
//     if (value == null) return null;
//     if (value is int) {
//       return value.toDouble(); // Convert int to double
//     } else if (value is double) {
//       return value; // Already a double
//     }
//     return null; // Or handle it as needed
//   }

//   Map<String, dynamic> toJson() => {
//         'accuracyScore': accuracyScore,
//         'pronunciationScore': pronunciationScore,
//         'completenessScore': completenessScore,
//         'fluencyScore': fluencyScore,
//       };
// }
