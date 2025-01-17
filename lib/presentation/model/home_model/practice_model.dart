// class PracticeModel {
//   final int? status;
//   final List<PracticeDetail>? body;

//   PracticeModel({
//     this.status,
//     this.body,
//   });

//   PracticeModel.fromJson(Map<String, dynamic> json)
//     : status = json['status'] as int?,
//       body = (json['body'] as List?)?.map((dynamic e) => PracticeDetail.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'status' : status,
//     'body' : body?.map((e) => e.toJson()).toList()
//   };
// }

// class PracticeDetail {
//   final int? practiceId;
//   final String? practiceCode;
//   final int? courseId;
//   final CoursePractice? course;

//   PracticeDetail({
//     this.practiceId,
//     this.practiceCode,
//     this.courseId,
//     this.course,
//   });

//   PracticeDetail.fromJson(Map<String, dynamic> json)
//     : practiceId = json['practice_id'] as int?,
//       practiceCode = json['practice_code'] as String?,
//       courseId = json['course_id'] as int?,
//       course = (json['course'] as Map<String,dynamic>?) != null ? CoursePractice.fromJson(json['course'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'practice_id' : practiceId,
//     'practice_code' : practiceCode,
//     'course_id' : courseId,
//     'course' : course?.toJson()
//   };
// }

// class CoursePractice {
//   final String? courseName;
//   final String? courseDescription;

//   CoursePractice(
//     this.courseName,
//     this.courseDescription,
//   );

//   CoursePractice.fromJson(Map<String, dynamic> json)
//     : courseName = json['course_name'] as String?,
//       courseDescription = json['course_description'] as String?;

//   Map<String, dynamic> toJson() => {
//     'course_name' : courseName,
//     'course_description' : courseDescription
//   };
// }
class CourseProgressModel {
  final int? _status;
  final List<CourseProgress>? _body;

  CourseProgressModel({
    int? status,
    List<CourseProgress>? body,
  })  : _status = status,
        _body = body;

  CourseProgressModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => CourseProgress.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<CourseProgress>? get body => _body;
}

class CourseProgress {
  final int? _progressCourseId;
  final int? _userId;
  final int? _courseId;
  final int? _progressPoin;
  final bool? _isActive;
  final bool? _isCourseCompleted;

  CourseProgress({
    int? progressCourseId,
    int? userId,
    int? courseId,
    int? progressPoin,
    bool? isActive,
    bool? isCourseCompleted,
  })  : _progressCourseId = progressCourseId,
        _userId = userId,
        _courseId = courseId,
        _progressPoin = progressPoin,
        _isActive = isActive,
        _isCourseCompleted = isCourseCompleted;

  CourseProgress.fromJson(Map<String, dynamic> json)
      : _progressCourseId = json['progress_course_id'] as int?,
        _userId = json['user_id'] as int?,
        _courseId = json['course_id'] as int?,
        _progressPoin = json['progress_poin'] as int?,
        _isActive = json['is_active'] as bool?,
        _isCourseCompleted = json['is_course_completed'] as bool?;

  Map<String, dynamic> toJson() => {
        'progress_course_id': _progressCourseId,
        'user_id': _userId,
        'course_id': _courseId,
        'progress_poin': _progressPoin,
        'is_active': _isActive,
        'is_course_completed': _isCourseCompleted,
      };

  int? get progressCourseId => _progressCourseId;
  int? get userId => _userId;
  int? get courseId => _courseId;
  int? get progressPoin => _progressPoin;
  bool? get isActive => _isActive;
  bool? get isCourseCompleted => _isCourseCompleted;
}

class PracticeModel {
  final int? _status;
  final List<PracticeDetail>? _body;

  PracticeModel({
    int? status,
    List<PracticeDetail>? body,
  })  : _status = status,
        _body = body;

  PracticeModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => PracticeDetail.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<PracticeDetail>? get body => _body;
}

class PracticeDetail {
  final int? _practiceId;
  final String? _practiceCode;
  final int? _courseId;
  final CoursePractice? _course;

  PracticeDetail({
    int? practiceId,
    String? practiceCode,
    int? courseId,
    CoursePractice? course,
  })  : _practiceId = practiceId,
        _practiceCode = practiceCode,
        _courseId = courseId,
        _course = course;

  PracticeDetail.fromJson(Map<String, dynamic> json)
      : _practiceId = json['practice_id'] as int?,
        _practiceCode = json['practice_code'] as String?,
        _courseId = json['course_id'] as int?,
        _course = (json['course'] as Map<String, dynamic>?) != null ? CoursePractice.fromJson(json['course'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'practice_id': _practiceId,
        'practice_code': _practiceCode,
        'course_id': _courseId,
        'course': _course?.toJson(),
      };

  int? get practiceId => _practiceId;
  String? get practiceCode => _practiceCode;
  int? get courseId => _courseId;
  CoursePractice? get course => _course;
}

class CoursePractice {
  final String? _courseName;
  final String? _courseDescription;

  CoursePractice({
    String? courseName,
    String? courseDescription,
  })  : _courseName = courseName,
        _courseDescription = courseDescription;

  CoursePractice.fromJson(Map<String, dynamic> json)
      : _courseName = json['course_name'] as String?,
        _courseDescription = json['course_description'] as String?;

  Map<String, dynamic> toJson() => {
        'course_name': _courseName,
        'course_description': _courseDescription,
      };

  String? get courseName => _courseName;
  String? get courseDescription => _courseDescription;
}
