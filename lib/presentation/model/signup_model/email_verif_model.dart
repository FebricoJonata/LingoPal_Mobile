class EmailVerifModel {
  final int? _status;
  final String? _message;

  EmailVerifModel({
    int? status,
    String? message,
  })  : _status = status,
        _message = message;

  int? get status => _status;
  String? get message => _message;

  EmailVerifModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'status': _status, 'message': _message};
}

