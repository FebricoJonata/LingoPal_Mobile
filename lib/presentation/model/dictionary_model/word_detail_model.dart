// class WordDetailModel {
//   final String? word;
//   final List<Meanings>? meanings;

//   WordDetailModel({
//     this.word,
//     this.meanings,
//   });

//   WordDetailModel.fromJson(Map<String, dynamic> json)
//     : word = json['word'] as String?,
//       meanings = (json['meanings'] as List?)?.map((dynamic e) => Meanings.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'word' : word,
//     'meanings' : meanings?.map((e) => e.toJson()).toList()
//   };
// }

// class Meanings {
//   final String? partOfSpeech;
//   final List<Definitions>? definitions;
//   final List<String>? synonyms;
//   final List<dynamic>? antonyms;

//   Meanings({
//     this.partOfSpeech,
//     this.definitions,
//     this.synonyms,
//     this.antonyms,
//   });

//   Meanings.fromJson(Map<String, dynamic> json)
//     : partOfSpeech = json['partOfSpeech'] as String?,
//       definitions = (json['definitions'] as List?)?.map((dynamic e) => Definitions.fromJson(e as Map<String,dynamic>)).toList(),
//       synonyms = (json['synonyms'] as List?)?.map((dynamic e) => e as String).toList(),
//       antonyms = json['antonyms'] as List?;

//   Map<String, dynamic> toJson() => {
//     'partOfSpeech' : partOfSpeech,
//     'definitions' : definitions?.map((e) => e.toJson()).toList(),
//     'synonyms' : synonyms,
//     'antonyms' : antonyms
//   };
// }

// class Definitions {
//   final String? definition;
//   String? example;

//   Definitions({
//     this.definition, this.example
//   });

//   Definitions.fromJson(Map<String, dynamic> json)
//     : definition = json['definition'] as String?, example = json.length==4? json['example'] as String? : null;

//   Map<String, dynamic> toJson() => {
//     'definition' : definition
//   };
// }
class WordDetailModel {
  final String? _word;
  final List<Meanings>? _meanings;

  WordDetailModel({
    String? word,
    List<Meanings>? meanings,
  })  : _word = word,
        _meanings = meanings;

  WordDetailModel.fromJson(Map<String, dynamic> json)
      : _word = json['word'] as String?,
        _meanings = (json['meanings'] as List?)?.map((dynamic e) => Meanings.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'word': _word,
        'meanings': _meanings?.map((e) => e.toJson()).toList(),
      };

  String? get word => _word;
  List<Meanings>? get meanings => _meanings;
}

class Meanings {
  final String? _partOfSpeech;
  final List<Definitions>? _definitions;
  final List<String>? _synonyms;
  final List<dynamic>? _antonyms;

  Meanings({
    String? partOfSpeech,
    List<Definitions>? definitions,
    List<String>? synonyms,
    List<dynamic>? antonyms,
  })  : _partOfSpeech = partOfSpeech,
        _definitions = definitions,
        _synonyms = synonyms,
        _antonyms = antonyms;

  Meanings.fromJson(Map<String, dynamic> json)
      : _partOfSpeech = json['partOfSpeech'] as String?,
        _definitions = (json['definitions'] as List?)?.map((dynamic e) => Definitions.fromJson(e as Map<String, dynamic>)).toList(),
        _synonyms = (json['synonyms'] as List?)?.map((dynamic e) => e as String).toList(),
        _antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() => {
        'partOfSpeech': _partOfSpeech,
        'definitions': _definitions?.map((e) => e.toJson()).toList(),
        'synonyms': _synonyms,
        'antonyms': _antonyms,
      };

  String? get partOfSpeech => _partOfSpeech;
  List<Definitions>? get definitions => _definitions;
  List<String>? get synonyms => _synonyms;
  List<dynamic>? get antonyms => _antonyms;
}

class Definitions {
  final String? _definition;
  final String? _example;

  Definitions({
    String? definition,
    String? example,
  })  : _definition = definition,
        _example = example;

  Definitions.fromJson(Map<String, dynamic> json)
      : _definition = json['definition'] as String?,
        _example = json['example'] as String?;

  Map<String, dynamic> toJson() => {
        'definition': _definition,
        'example': _example,
      };

  String? get definition => _definition;
  String? get example => _example;
}
