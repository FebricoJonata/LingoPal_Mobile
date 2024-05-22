class SpeechToText {
  final String? recognitionStatus;
  final int? offset;
  final int? duration;
  final List<NBest>? nBest;
  final String? displayText;

  SpeechToText({
    this.recognitionStatus,
    this.offset,
    this.duration,
    this.nBest,
    this.displayText,
  });

  SpeechToText.fromJson(Map<String, dynamic> json)
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
  final int? confidence;
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
      : confidence = json['Confidence'] as int?,
        lexical = json['Lexical'] as String?,
        iTN = json['ITN'] as String?,
        maskedITN = json['MaskedITN'] as String?,
        display = json['Display'] as String?;

  Map<String, dynamic> toJson() =>
      {'Confidence': confidence, 'Lexical': lexical, 'ITN': iTN, 'MaskedITN': maskedITN, 'Display': display};
}
