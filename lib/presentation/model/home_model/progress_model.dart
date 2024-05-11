class ProgressUserModel {
  final int? status;
  final Body? body;

  ProgressUserModel({
    this.status,
    this.body,
  });

  ProgressUserModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as Map<String, dynamic>?) != null
            ? Body.fromJson(json['body'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.toJson()};
}

class Body {
  final dynamic error;
  final List<Data>? data;
  final dynamic count;
  final int? status;
  final String? statusText;

  Body({
    this.error,
    this.data,
    this.count,
    this.status,
    this.statusText,
  });

  Body.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
        count = json['count'],
        status = json['status'] as int?,
        statusText = json['statusText'] as String?;

  Map<String, dynamic> toJson() => {
        'error': error,
        'data': data?.map((e) => e.toJson()).toList(),
        'count': count,
        'status': status,
        'statusText': statusText
      };
}

class Data {
  final int? progressId;
  final int? progressCourseId;
  final int? totalPoin;
  final int? userId;
  final User? user;
  final Level? level;

  Data({
    this.progressId,
    this.progressCourseId,
    this.totalPoin,
    this.userId,
    this.user,
    this.level,
  });

  Data.fromJson(Map<String, dynamic> json)
      : progressId = json['progress_id'] as int?,
        progressCourseId = json['progress_course_id'] as int?,
        totalPoin = json['total_poin'] as int?,
        userId = json['user_id'] as int?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        level = (json['level'] as Map<String, dynamic>?) != null
            ? Level.fromJson(json['level'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'progress_id': progressId,
        'progress_course_id': progressCourseId,
        'total_poin': totalPoin,
        'user_id': userId,
        'user': user?.toJson(),
        'level': level?.toJson()
      };
}

class User {
  final String? name;
  final String? email;

  User({
    this.name,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}

class Level {
  final String? userLevelCode;
  final String? userLevelName;

  Level({
    this.userLevelCode,
    this.userLevelName,
  });

  Level.fromJson(Map<String, dynamic> json)
      : userLevelCode = json['user_level_code'] as String?,
        userLevelName = json['user_level_name'] as String?;

  Map<String, dynamic> toJson() => {'user_level_code': userLevelCode, 'user_level_name': userLevelName};
}
