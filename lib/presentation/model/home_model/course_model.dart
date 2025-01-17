class CourseModel {
  final int? _status;
  final List<Course>? _body;

  CourseModel({
    int? status,
    List<Course>? body,
  })  : _status = status,
        _body = body;

  int? get status => _status;
  List<Course>? get body => _body;

  CourseModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => Course.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };
}

class Course {
  final int? _courseId;
  final String? _courseName;
  final String? _courseDescription;
  final dynamic _minPoin;
  final int? _userLevelId;
  final CourseCategory? _category;

  Course({
    int? courseId,
    String? courseName,
    String? courseDescription,
    dynamic minPoin,
    int? userLevelId,
    CourseCategory? category,
  })  : _courseId = courseId,
        _courseName = courseName,
        _courseDescription = courseDescription,
        _minPoin = minPoin,
        _userLevelId = userLevelId,
        _category = category;

  int? get courseId => _courseId;
  String? get courseName => _courseName;
  String? get courseDescription => _courseDescription;
  dynamic get minPoin => _minPoin;
  int? get userLevelId => _userLevelId;
  CourseCategory? get category => _category;

  Course.fromJson(Map<String, dynamic> json)
      : _courseId = json['course_id'] as int?,
        _courseName = json['course_name'] as String?,
        _courseDescription = json['course_description'] as String?,
        _minPoin = json['min_poin'],
        _userLevelId = json['user_level_id'] as int?,
        _category = (json['category'] as Map<String, dynamic>?) != null
            ? CourseCategory.fromJson(json['category'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'course_id': _courseId,
        'course_name': _courseName,
        'course_description': _courseDescription,
        'min_poin': _minPoin,
        'user_level_id': _userLevelId,
        'category': _category?.toJson(),
      };
}

class CourseCategory {
  final String? _courseCategoryName;

  CourseCategory({
    String? courseCategoryName,
  }) : _courseCategoryName = courseCategoryName;

  String? get courseCategoryName => _courseCategoryName;

  CourseCategory.fromJson(Map<String, dynamic> json)
      : _courseCategoryName = json['course_category_name'] as String?;

  Map<String, dynamic> toJson() => {
        'course_category_name': _courseCategoryName,
      };
}