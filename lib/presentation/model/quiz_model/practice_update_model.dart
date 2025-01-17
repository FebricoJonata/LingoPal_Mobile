// class PracticeUpdate {
//   final int? status;
//   final List<Body>? body;

//   PracticeUpdate({
//     this.status,
//     this.body,
//   });

//   PracticeUpdate.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as int?,
//         body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String, dynamic>)).toList();

//   Map<String, dynamic> toJson() => {'status': status, 'body': body?.map((e) => e.toJson()).toList()};
// }

// class Body {
//   final int? progressPracticeId;
//   final int? userId;
//   final int? practiceId;
//   final int? progressPoin;
//   final bool? isActive;
//   final bool? isPassed;

//   Body({
//     this.progressPracticeId,
//     this.userId,
//     this.practiceId,
//     this.progressPoin,
//     this.isActive,
//     this.isPassed,
//   });

//   Body.fromJson(Map<String, dynamic> json)
//       : progressPracticeId = json['progress_practice_id'] as int?,
//         userId = json['user_id'] as int?,
//         practiceId = json['practice_id'] as int?,
//         progressPoin = json['progress_poin'] as int?,
//         isActive = json['is_active'] as bool?,
//         isPassed = json['is_passed'] as bool?;

//   Map<String, dynamic> toJson() =>
//       {'progress_practice_id': progressPracticeId, 'user_id': userId, 'practice_id': practiceId, 'progress_poin': progressPoin, 'is_active': isActive, 'is_passed': isPassed};
// }
class PracticeUpdate {
  final int? _status;
  final List<Body>? _body;

  PracticeUpdate({
    int? status,
    List<Body>? body,
  })  : _status = status,
        _body = body;

  PracticeUpdate.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<Body>? get body => _body;
}

class Body {
  final int? _progressPracticeId;
  final int? _userId;
  final int? _practiceId;
  final int? _progressPoin;
  final bool? _isActive;
  final bool? _isPassed;

  Body({
    int? progressPracticeId,
    int? userId,
    int? practiceId,
    int? progressPoin,
    bool? isActive,
    bool? isPassed,
  })  : _progressPracticeId = progressPracticeId,
        _userId = userId,
        _practiceId = practiceId,
        _progressPoin = progressPoin,
        _isActive = isActive,
        _isPassed = isPassed;

  Body.fromJson(Map<String, dynamic> json)
      : _progressPracticeId = json['progress_practice_id'] as int?,
        _userId = json['user_id'] as int?,
        _practiceId = json['practice_id'] as int?,
        _progressPoin = json['progress_poin'] as int?,
        _isActive = json['is_active'] as bool?,
        _isPassed = json['is_passed'] as bool?;

  Map<String, dynamic> toJson() => {
        'progress_practice_id': _progressPracticeId,
        'user_id': _userId,
        'practice_id': _practiceId,
        'progress_poin': _progressPoin,
        'is_active': _isActive,
        'is_passed': _isPassed,
      };

  int? get progressPracticeId => _progressPracticeId;
  int? get userId => _userId;
  int? get practiceId => _practiceId;
  int? get progressPoin => _progressPoin;
  bool? get isActive => _isActive;
  bool? get isPassed => _isPassed;
}
