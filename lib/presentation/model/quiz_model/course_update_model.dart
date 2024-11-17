class CourseUpdate {
  final int? status;
  final List<Body>? body;

  CourseUpdate({
    this.status,
    this.body,
  });

  CourseUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.map((e) => e.toJson()).toList()};
}

class Body {
  final int? progressCourseId;
  final int? userId;
  final int? courseId;
  final int? progressPoin;
  final bool? isActive;
  final bool? isCourseCompleted;

  Body({
    this.progressCourseId,
    this.userId,
    this.courseId,
    this.progressPoin,
    this.isActive,
    this.isCourseCompleted,
  });

  Body.fromJson(Map<String, dynamic> json)
      : progressCourseId = json['progress_course_id'] as int?,
        userId = json['user_id'] as int?,
        courseId = json['course_id'] as int?,
        progressPoin = json['progress_poin'] as int?,
        isActive = json['is_active'] as bool?,
        isCourseCompleted = json['is_course_completed'] as bool?;

  Map<String, dynamic> toJson() =>
      {'progress_course_id': progressCourseId, 'user_id': userId, 'course_id': courseId, 'progress_poin': progressPoin, 'is_active': isActive, 'is_course_completed': isCourseCompleted};
}
