class SpeechToText {
  final Recognition? recognition;
  final PronunciationScores? pronunciationScores;

  SpeechToText({
    this.recognition,
    this.pronunciationScores,
  });

  SpeechToText.fromJson(Map<String, dynamic> json)
      : recognition = (json['recognition'] as Map<String, dynamic>?) != null
            ? Recognition.fromJson(json['recognition'] as Map<String, dynamic>)
            : null,
        pronunciationScores = (json['pronunciationScores'] as Map<String, dynamic>?) != null
            ? PronunciationScores.fromJson(json['pronunciationScores'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'recognition': recognition?.toJson(), 'pronunciationScores': pronunciationScores?.toJson()};
}

class Recognition {
  final String? recognitionStatus;
  final int? offset;
  final int? duration;
  final List<NBest>? nBest;
  final String? displayText;

  Recognition({
    this.recognitionStatus,
    this.offset,
    this.duration,
    this.nBest,
    this.displayText,
  });

  Recognition.fromJson(Map<String, dynamic> json)
      : recognitionStatus = json['RecognitionStatus'] as String?,
        offset = json['Offset'] as int?,
        duration = json['Duration'] as int?,
        nBest = (json['NBest'] as List?)?.map((dynamic e) => NBest.fromJson(e as Map<String, dynamic>)).toList(),
        displayText = json['DisplayText'] as String?;

  Map<String, dynamic> toJson() => {
        'RecognitionStatus': recognitionStatus,
        'Offset': offset,
        'Duration': duration,
        'NBest': nBest?.map((e) => e.toJson()).toList(),
        'DisplayText': displayText
      };
}

class NBest {
  final double? confidence;
  final String? lexical;
  final String? iTN;
  final String? maskedITN;
  final String? display;

  NBest({
    this.confidence,
    this.lexical,
    this.iTN,
    this.maskedITN,
    this.display,
  });

  NBest.fromJson(Map<String, dynamic> json)
      : confidence = json['Confidence'] as double?,
        lexical = json['Lexical'] as String?,
        iTN = json['ITN'] as String?,
        maskedITN = json['MaskedITN'] as String?,
        display = json['Display'] as String?;

  Map<String, dynamic> toJson() =>
      {'Confidence': confidence, 'Lexical': lexical, 'ITN': iTN, 'MaskedITN': maskedITN, 'Display': display};
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

  Map<String, dynamic> toJson() => {
        'accuracyScore': accuracyScore,
        'pronunciationScore': pronunciationScore,
        'completenessScore': completenessScore,
        'fluencyScore': fluencyScore
      };
}
