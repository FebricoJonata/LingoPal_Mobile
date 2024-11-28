class MaterialModel {
  final int? status;
  final List<MaterialContent>? body;

  MaterialModel({
    this.status,
    this.body,
  });

  MaterialModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      body = (json['body'] as List?)?.map((dynamic e) => MaterialContent.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'body' : body?.map((e) => e.toJson()).toList()
  };
}

class MaterialContent {
  final int? id;
  final String? title;
  final String? type;
  final String? category;
  final String? source;
  final dynamic cover;
  final String? content;
  final String? description;
  final String? createdAt;

  MaterialContent({
    this.id,
    this.title,
    this.type,
    this.category,
    this.source,
    this.cover,
    this.content,
    this.description,
    this.createdAt,
  });

  MaterialContent.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      type = json['type'] as String?,
      category = json['category'] as String?,
      source = json['source'] as String?,
      cover = json['cover'],
      content = json['content'] as String?,
      description = json['description'] as String?,
      createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'type' : type,
    'category' : category,
    'source' : source,
    'cover' : cover,
    'content' : content,
    'description' : description,
    'created_at' : createdAt
  };
}