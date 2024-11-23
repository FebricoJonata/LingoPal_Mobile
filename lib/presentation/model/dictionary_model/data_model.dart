class WordData {
  final String? word;
  final List<Meanings>? meanings;

  WordData({
    this.word,
    this.meanings,
  });

  WordData.fromJson(Map<String, dynamic> json)
    : word = json['word'] as String?,
      meanings = (json['meanings'] as List?)?.map((dynamic e) => Meanings.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'word' : word,
    'meanings' : meanings?.map((e) => e.toJson()).toList()
  };
}

class Meanings {
  final String? partOfSpeech;
  final List<Definitions>? definitions;
  final List<String>? synonyms;
  final List<dynamic>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Meanings.fromJson(Map<String, dynamic> json)
    : partOfSpeech = json['partOfSpeech'] as String?,
      definitions = (json['definitions'] as List?)?.map((dynamic e) => Definitions.fromJson(e as Map<String,dynamic>)).toList(),
      synonyms = (json['synonyms'] as List?)?.map((dynamic e) => e as String).toList(),
      antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() => {
    'partOfSpeech' : partOfSpeech,
    'definitions' : definitions?.map((e) => e.toJson()).toList(),
    'synonyms' : synonyms,
    'antonyms' : antonyms
  };
}

class Definitions {
  final String? definition;
  String? example;

  Definitions({
    this.definition, this.example
  });

  Definitions.fromJson(Map<String, dynamic> json)
    : definition = json['definition'] as String?, example = json.length==4? json['example'] as String? : null;

  Map<String, dynamic> toJson() => {
    'definition' : definition
  };
}