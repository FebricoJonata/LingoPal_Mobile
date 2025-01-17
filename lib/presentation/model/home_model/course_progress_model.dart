class CourseProgressModel {
  final int? _status;
  final List<CourseProgress>? _body;

  CourseProgressModel({
    int? status,
    List<CourseProgress>? body,
  })  : _status = status,
        _body = body;

  int? get status => _status;
  List<CourseProgress>? get body => _body;

  CourseProgressModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => CourseProgress.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };
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

  int? get progressCourseId => _progressCourseId;
  int? get userId => _userId;
  int? get courseId => _courseId;
  int? get progressPoin => _progressPoin;
  bool? get isActive => _isActive;
  bool? get isCourseCompleted => _isCourseCompleted;

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
}