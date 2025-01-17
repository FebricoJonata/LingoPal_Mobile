import 'package:lingo_pal_mobile/presentation/model/login_model/login_model.dart';

class ProgressUserModel {
  final int? _status;
  final List<ProgressUser>? _body;

  ProgressUserModel({
    int? status,
    List<ProgressUser>? body,
  })  : _status = status,
        _body = body;

  int? get status => _status;
  List<ProgressUser>? get body => _body;

  ProgressUserModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body']['data'] as List?)?.map((dynamic e) => ProgressUser.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'status': _status, 'body': _body?.map((e) => e.toJson()).toList()};
}

class ProgressUser {
  final int? _progressId;
  final int? _progressCourseId;
  final int? _totalPoin;
  final int? _userId;
  final User? _user;
  final UserLevelProgress? _level;

  ProgressUser({
    int? progressId,
    int? progressCourseId,
    int? totalPoin,
    int? userId,
    User? user,
    UserLevelProgress? level,
  })  : _progressId = progressId,
        _progressCourseId = progressCourseId,
        _totalPoin = totalPoin,
        _userId = userId,
        _user = user,
        _level = level;

  int? get progressId => _progressId;
  int? get progressCourseId => _progressCourseId;
  int? get totalPoin => _totalPoin;
  int? get userId => _userId;
  User? get user => _user;
  UserLevelProgress? get level => _level;

  ProgressUser.fromJson(Map<String, dynamic> json)
      : _progressId = json['progress_id'] as int?,
        _progressCourseId = json['progress_course_id'] as int?,
        _totalPoin = json['total_poin'] as int?,
        _userId = json['user_id'] as int?,
        _user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        _level = (json['level'] as Map<String, dynamic>?) != null
            ? UserLevelProgress.fromJson(json['level'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'progress_id': _progressId,
        'progress_course_id': _progressCourseId,
        'total_poin': _totalPoin,
        'user_id': _userId,
        'user': _user?.toJson(),
        'level': _level?.toJson()
      };
}

class UserLevelProgress {
  final String? _userLevelCode;
  final String? _userLevelName;

  UserLevelProgress({
    String? userLevelCode,
    String? userLevelName,
  })  : _userLevelCode = userLevelCode,
        _userLevelName = userLevelName;

  String? get userLevelCode => _userLevelCode;
  String? get userLevelName => _userLevelName;

  UserLevelProgress.fromJson(Map<String, dynamic> json)
      : _userLevelCode = json['user_level_code'] as String?,
        _userLevelName = json['user_level_name'] as String?;

  Map<String, dynamic> toJson() => {'user_level_code': _userLevelCode, 'user_level_name': _userLevelName};
}
