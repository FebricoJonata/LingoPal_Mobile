// class CourseModel {
//   final int? status;
//   final List<Course>? body;

//   CourseModel({
//     this.status,
//     this.body,
//   });

//   CourseModel.fromJson(Map<String, dynamic> json)
//     : status = json['status'] as int?,
//       body = (json['body'] as List?)?.map((dynamic e) => Course.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'status' : status,
//     'body' : body?.map((e) => e.toJson()).toList()
//   };
// }

// class Course {
//   final int? courseId;
//   final String? courseName;
//   final String? courseDescription;
//   final dynamic minPoin;
//   final int? userLevelId;
//   final Category? category;

//   Course({
//     this.courseId,
//     this.courseName,
//     this.courseDescription,
//     this.minPoin,
//     this.userLevelId,
//     this.category,
//   });

//   Course.fromJson(Map<String, dynamic> json)
//     : courseId = json['course_id'] as int?,
//       courseName = json['course_name'] as String?,
//       courseDescription = json['course_description'] as String?,
//       minPoin = json['min_poin'],
//       userLevelId = json['user_level_id'] as int?,
//       category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'course_id' : courseId,
//     'course_name' : courseName,
//     'course_description' : courseDescription,
//     'min_poin' : minPoin,
//     'user_level_id' : userLevelId,
//     'category' : category?.toJson()
//   };
// }

// class Category {
//   final String? courseCategoryName;

//   Category({
//     this.courseCategoryName,
//   });

//   Category.fromJson(Map<String, dynamic> json)
//     : courseCategoryName = json['course_category_name'] as String?;

//   Map<String, dynamic> toJson() => {
//     'course_category_name' : courseCategoryName
//   };
// }
class CourseModel {
  final int? _status;
  final List<Course>? _body;

  CourseModel({
    int? status,
    List<Course>? body,
  })  : _status = status,
        _body = body;

  CourseModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => Course.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<Course>? get body => _body;
}

class Course {
  final int? _courseId;
  final String? _courseName;
  final String? _courseDescription;
  final dynamic _minPoin;
  final int? _userLevelId;
  final Category? _category;

  Course({
    int? courseId,
    String? courseName,
    String? courseDescription,
    dynamic minPoin,
    int? userLevelId,
    Category? category,
  })  : _courseId = courseId,
        _courseName = courseName,
        _courseDescription = courseDescription,
        _minPoin = minPoin,
        _userLevelId = userLevelId,
        _category = category;

  Course.fromJson(Map<String, dynamic> json)
      : _courseId = json['course_id'] as int?,
        _courseName = json['course_name'] as String?,
        _courseDescription = json['course_description'] as String?,
        _minPoin = json['min_poin'],
        _userLevelId = json['user_level_id'] as int?,
        _category = (json['category'] as Map<String, dynamic>?) != null ? Category.fromJson(json['category'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'course_id': _courseId,
        'course_name': _courseName,
        'course_description': _courseDescription,
        'min_poin': _minPoin,
        'user_level_id': _userLevelId,
        'category': _category?.toJson(),
      };

  int? get courseId => _courseId;
  String? get courseName => _courseName;
  String? get courseDescription => _courseDescription;
  dynamic get minPoin => _minPoin;
  int? get userLevelId => _userLevelId;
  Category? get category => _category;
}

class Category {
  final String? _courseCategoryName;

  Category({
    String? courseCategoryName,
  }) : _courseCategoryName = courseCategoryName;

  Category.fromJson(Map<String, dynamic> json) : _courseCategoryName = json['course_category_name'] as String?;

  Map<String, dynamic> toJson() => {
        'course_category_name': _courseCategoryName,
      };

  String? get courseCategoryName => _courseCategoryName;
}
