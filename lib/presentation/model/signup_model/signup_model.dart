import 'package:lingo_pal_mobile/presentation/model/login_model/login_model.dart';

class SignUpModel {
  final String? _message;
  final List<User>? _user;

  SignUpModel({
    String? message,
    List<User>? user,
  })  : _message = message,
        _user = user;

  String? get message => _message;
  List<User>? get user => _user;

  SignUpModel.fromJson(Map<String, dynamic> json)
      : _message = json['message'] as String?,
        _user = (json['data'] as List?)?.map((dynamic e) => User.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'message': _message, 'data': _user?.map((e) => e.toJson()).toList()};
}
