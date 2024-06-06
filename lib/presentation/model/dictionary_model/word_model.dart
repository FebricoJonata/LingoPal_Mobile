class WordModel {
  final int? status;
  final List<Vocab>? body;

  WordModel({
    this.status,
    this.body,
  });

  WordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      body = (json['body'] as List?)?.map((dynamic e) => Vocab.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'body' : body?.map((e) => e.toJson()).toList()
  };
}

class Vocab {
  final String? word;
  final String? alphabet;

  Vocab({
    this.word,
    this.alphabet,
  });

  Vocab.fromJson(Map<String, dynamic> json)
    : word = json['word'] as String?,
      alphabet = json['alphabet'] as String?;

  Map<String, dynamic> toJson() => {
    'word' : word,
    'alphabet' : alphabet
  };
}