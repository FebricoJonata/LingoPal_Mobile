class TTSModel {
  final String? audioContent;

  TTSModel({
    this.audioContent,
  });

  TTSModel.fromJson(Map<String, dynamic> json) : audioContent = json['audioContent'] as String?;

  Map<String, dynamic> toJson() => {'audioContent': audioContent};
}
