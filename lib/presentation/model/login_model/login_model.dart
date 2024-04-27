class LoginModel {
  final String? message;
  final String? error;

  LoginModel(
    this.error, {
    this.message,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        error = json['error'] as String?;

  Map<String, dynamic> toJson() => {'message': message, 'error': error};
}


//https://itsallwidgets.com/json-to-dart-converter-support-null-safety