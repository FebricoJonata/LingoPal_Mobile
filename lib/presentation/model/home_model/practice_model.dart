class PracticeModel {
  final int? status;
  final List<PracticeDetail>? body;

  PracticeModel({
    this.status,
    this.body,
  });

  PracticeModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      body = (json['body'] as List?)?.map((dynamic e) => PracticeDetail.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'body' : body?.map((e) => e.toJson()).toList()
  };
}

class PracticeDetail {
  final int? practiceId;
  final String? practiceCode;
  final int? courseId;
  final CoursePractice? course;

  PracticeDetail({
    this.practiceId,
    this.practiceCode,
    this.courseId,
    this.course,
  });

  PracticeDetail.fromJson(Map<String, dynamic> json)
    : practiceId = json['practice_id'] as int?,
      practiceCode = json['practice_code'] as String?,
      courseId = json['course_id'] as int?,
      course = (json['course'] as Map<String,dynamic>?) != null ? CoursePractice.fromJson(json['course'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'practice_id' : practiceId,
    'practice_code' : practiceCode,
    'course_id' : courseId,
    'course' : course?.toJson()
  };
}

class CoursePractice {
  final String? courseName;
  final String? courseDescription;

  CoursePractice(
    this.courseName,
    this.courseDescription,
  );

  CoursePractice.fromJson(Map<String, dynamic> json)
    : courseName = json['course_name'] as String?,
      courseDescription = json['course_description'] as String?;

  Map<String, dynamic> toJson() => {
    'course_name' : courseName,
    'course_description' : courseDescription
  };
}