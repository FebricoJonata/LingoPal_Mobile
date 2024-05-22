class CourseModel {
  final int? status;
  final List<Course>? body;

  CourseModel({
    this.status,
    this.body,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      body = (json['body'] as List?)?.map((dynamic e) => Course.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'body' : body?.map((e) => e.toJson()).toList()
  };
}

class Course {
  final int? courseId;
  final String? courseName;
  final String? courseDescription;
  final dynamic minPoin;
  final int? userLevelId;
  final Category? category;

  Course({
    this.courseId,
    this.courseName,
    this.courseDescription,
    this.minPoin,
    this.userLevelId,
    this.category,
  });

  Course.fromJson(Map<String, dynamic> json)
    : courseId = json['course_id'] as int?,
      courseName = json['course_name'] as String?,
      courseDescription = json['course_description'] as String?,
      minPoin = json['min_poin'],
      userLevelId = json['user_level_id'] as int?,
      category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'course_id' : courseId,
    'course_name' : courseName,
    'course_description' : courseDescription,
    'min_poin' : minPoin,
    'user_level_id' : userLevelId,
    'category' : category?.toJson()
  };
}

class Category {
  final String? courseCategoryName;

  Category({
    this.courseCategoryName,
  });

  Category.fromJson(Map<String, dynamic> json)
    : courseCategoryName = json['course_category_name'] as String?;

  Map<String, dynamic> toJson() => {
    'course_category_name' : courseCategoryName
  };
}