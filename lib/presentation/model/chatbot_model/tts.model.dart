class TTSModel {
  final String? _audioContent;

  TTSModel(String audioContent): _audioContent = audioContent ;

  TTSModel.fromJson(Map<String, dynamic> json) : _audioContent = json['audioContent'] as String?;

  get audioContent => _audioContent;

  Map<String, dynamic> toJson() => {'audioContent': _audioContent};
}
