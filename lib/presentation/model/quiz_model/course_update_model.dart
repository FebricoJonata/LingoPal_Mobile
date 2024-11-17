class CourseUpdate {
  final int? status;
  final String? body;

  CourseUpdate({
    this.status,
    this.body,
  });

  CourseUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = json['body'] as String?;

  Map<String, dynamic> toJson() => {'status': status, 'body': body};
}
