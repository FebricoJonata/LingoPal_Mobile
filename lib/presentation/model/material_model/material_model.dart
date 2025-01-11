// class MaterialModel {
//   final int? status;
//   final List<MaterialContent>? body;

//   MaterialModel({
//     this.status,
//     this.body,
//   });

//   MaterialModel.fromJson(Map<String, dynamic> json)
//     : status = json['status'] as int?,
//       body = (json['body'] as List?)?.map((dynamic e) => MaterialContent.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'status' : status,
//     'body' : body?.map((e) => e.toJson()).toList()
//   };
// }

// class MaterialContent {
//   final int? id;
//   final String? title;
//   final String? type;
//   final String? category;
//   final String? source;
//   final dynamic cover;
//   final String? content;
//   final String? description;
//   final String? createdAt;

//   MaterialContent({
//     this.id,
//     this.title,
//     this.type,
//     this.category,
//     this.source,
//     this.cover,
//     this.content,
//     this.description,
//     this.createdAt,
//   });

//   MaterialContent.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int?,
//       title = json['title'] as String?,
//       type = json['type'] as String?,
//       category = json['category'] as String?,
//       source = json['source'] as String?,
//       cover = json['cover'],
//       content = json['content'] as String?,
//       description = json['description'] as String?,
//       createdAt = json['created_at'] as String?;

//   Map<String, dynamic> toJson() => {
//     'id' : id,
//     'title' : title,
//     'type' : type,
//     'category' : category,
//     'source' : source,
//     'cover' : cover,
//     'content' : content,
//     'description' : description,
//     'created_at' : createdAt
//   };
// }
class MaterialModel {
  int? _status;
  List<MaterialContent>? _body;

  MaterialModel({
    int? status,
    List<MaterialContent>? body,
  })  : _status = status,
        _body = body;

  MaterialModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)
            ?.map((dynamic e) => MaterialContent.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  // Getter and Setter for _status
  int? get status => _status;
  set status(int? value) => _status = value;

  // Getter and Setter for _body
  List<MaterialContent>? get body => _body;
  set body(List<MaterialContent>? value) => _body = value;
}

class MaterialContent {
  int? _id;
  String? _title;
  String? _type;
  String? _category;
  String? _source;
  String? _cover;
  String? _content;
  String? _description;
  String? _createdAt;

  MaterialContent({
    int? id,
    String? title,
    String? type,
    String? category,
    String? source,
    String? cover,
    String? content,
    String? description,
    String? createdAt,
  })  : _id = id,
        _title = title,
        _type = type,
        _category = category,
        _source = source,
        _cover = cover,
        _content = content,
        _description = description,
        _createdAt = createdAt;

  MaterialContent.fromJson(Map<String, dynamic> json)
      : _id = json['id'] as int?,
        _title = json['title'] as String?,
        _type = json['type'] as String?,
        _category = json['category'] as String?,
        _source = json['source'] as String?,
        _cover = json['cover'] as String?,
        _content = json['content'] as String?,
        _description = json['description'] as String?,
        _createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': _id,
        'title': _title,
        'type': _type,
        'category': _category,
        'source': _source,
        'cover': _cover,
        'content': _content,
        'description': _description,
        'created_at': _createdAt,
      };

  // Getter and Setter for _id
  int? get id => _id;
  set id(int? value) => _id = value;

  // Getter and Setter for _title
  String? get title => _title;
  set title(String? value) => _title = value;

  // Getter and Setter for _type
  String? get type => _type;
  set type(String? value) => _type = value;

  // Getter and Setter for _category
  String? get category => _category;
  set category(String? value) => _category = value;

  // Getter and Setter for _source
  String? get source => _source;
  set source(String? value) => _source = value;

  // Getter and Setter for _cover
  String? get cover => _cover;
  set cover(String? value) => _cover = value;

  // Getter and Setter for _content
  String? get content => _content;
  set content(String? value) => _content = value;

  // Getter and Setter for _description
  String? get description => _description;
  set description(String? value) => _description = value;

  // Getter and Setter for _createdAt
  String? get createdAt => _createdAt;
  set createdAt(String? value) => _createdAt = value;
}
