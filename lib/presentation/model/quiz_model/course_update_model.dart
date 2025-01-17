// class CourseUpdate {
//   final int? status;
//   final String? body;

//   CourseUpdate({
//     this.status,
//     this.body,
//   });

//   CourseUpdate.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as int?,
//         body = json['body'] as String?;

//   Map<String, dynamic> toJson() => {'status': status, 'body': body};
// }

class CourseUpdate {
  final int? _status;
  final String? _body;

  CourseUpdate({
    int? status,
    String? body,
  })  : _status = status,
        _body = body;

  CourseUpdate.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = json['body'] as String?;

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body,
      };

  int? get status => _status;
  String? get body => _body;
}
