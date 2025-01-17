// class WordModel {
//   final int? status;
//   final List<Vocab>? body;

//   WordModel({
//     this.status,
//     this.body,
//   });

//   WordModel.fromJson(Map<String, dynamic> json)
//     : status = json['status'] as int?,
//       body = (json['body'] as List?)?.map((dynamic e) => Vocab.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'status' : status,
//     'body' : body?.map((e) => e.toJson()).toList()
//   };
// }

// class Vocab {
//   final String? word;
//   final String? alphabet;

//   Vocab({
//     this.word,
//     this.alphabet,
//   });

//   Vocab.fromJson(Map<String, dynamic> json)
//     : word = json['word'] as String?,
//       alphabet = json['alphabet'] as String?;

//   Map<String, dynamic> toJson() => {
//     'word' : word,
//     'alphabet' : alphabet
//   };
// }
class WordModel {
  final int? _status;
  final List<Vocab>? _body;

  WordModel({
    int? status,
    List<Vocab>? body,
  })  : _status = status,
        _body = body;

  WordModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => Vocab.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<Vocab>? get body => _body;
}

class Vocab {
  final String? _word;
  final String? _alphabet;

  Vocab({
    String? word,
    String? alphabet,
  })  : _word = word,
        _alphabet = alphabet;

  Vocab.fromJson(Map<String, dynamic> json)
      : _word = json['word'] as String?,
        _alphabet = json['alphabet'] as String?;

  Map<String, dynamic> toJson() => {
        'word': _word,
        'alphabet': _alphabet,
      };

  String? get word => _word;
  String? get alphabet => _alphabet;
}
