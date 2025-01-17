// class PracticeProgressModel {
//   final int? status;
//   final List<PracticeProgress>? body;

//   PracticeProgressModel({
//     this.status,
//     this.body,
//   });

//   PracticeProgressModel.fromJson(Map<String, dynamic> json)
//     : status = json['status'] as int?,
//       body = (json['body'] as List?)?.map((dynamic e) => PracticeProgress.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'status' : status,
//     'body' : body?.map((e) => e.toJson()).toList()
//   };
// }

// class PracticeProgress {
//   final int? progressPracticeId;
//   final int? userId;
//   final int? practiceId;
//   final int? progressPoin;
//   final bool? isActive;
//   final bool? isPassed;
//   final PracticeCode? practiceCode;

//   PracticeProgress({
//     this.progressPracticeId,
//     this.userId,
//     this.practiceId,
//     this.progressPoin,
//     this.isActive,
//     this.isPassed,
//     this.practiceCode,
//   });

//   PracticeProgress.fromJson(Map<String, dynamic> json)
//     : progressPracticeId = json['progress_practice_id'] as int?,
//       userId = json['user_id'] as int?,
//       practiceId = json['practice_id'] as int?,
//       progressPoin = json['progress_poin'] as int?,
//       isActive = json['is_active'] as bool?,
//       isPassed = json['is_passed'] as bool?,
//       practiceCode = (json['practice'] as Map<String,dynamic>?) != null ? PracticeCode.fromJson(json['practice'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'progress_practice_id' : progressPracticeId,
//     'user_id' : userId,
//     'practice_id' : practiceId,
//     'progress_poin' : progressPoin,
//     'is_active' : isActive,
//     'is_passed' : isPassed,
//     'practice' : practiceCode?.toJson()
//   };
// }

// class PracticeCode {
//   final String? code;

//   PracticeCode({
//     this.code,
//   });

//   PracticeCode.fromJson(Map<String, dynamic> json)
//     : code = json['practice_code'] as String?;

//   Map<String, dynamic> toJson() => {
//     'practice_code' : code
//   };
// }
class PracticeProgressModel {
  final int? _status;
  final List<PracticeProgress>? _body;

  PracticeProgressModel({
    int? status,
    List<PracticeProgress>? body,
  })  : _status = status,
        _body = body;

  PracticeProgressModel.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as List?)?.map((dynamic e) => PracticeProgress.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'status': _status,
        'body': _body?.map((e) => e.toJson()).toList(),
      };

  int? get status => _status;
  List<PracticeProgress>? get body => _body;
}

class PracticeProgress {
  final int? _progressPracticeId;
  final int? _userId;
  final int? _practiceId;
  final int? _progressPoin;
  final bool? _isActive;
  final bool? _isPassed;
  final PracticeCode? _practiceCode;

  PracticeProgress({
    int? progressPracticeId,
    int? userId,
    int? practiceId,
    int? progressPoin,
    bool? isActive,
    bool? isPassed,
    PracticeCode? practiceCode,
  })  : _progressPracticeId = progressPracticeId,
        _userId = userId,
        _practiceId = practiceId,
        _progressPoin = progressPoin,
        _isActive = isActive,
        _isPassed = isPassed,
        _practiceCode = practiceCode;

  PracticeProgress.fromJson(Map<String, dynamic> json)
      : _progressPracticeId = json['progress_practice_id'] as int?,
        _userId = json['user_id'] as int?,
        _practiceId = json['practice_id'] as int?,
        _progressPoin = json['progress_poin'] as int?,
        _isActive = json['is_active'] as bool?,
        _isPassed = json['is_passed'] as bool?,
        _practiceCode = (json['practice'] as Map<String, dynamic>?) != null ? PracticeCode.fromJson(json['practice'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'progress_practice_id': _progressPracticeId,
        'user_id': _userId,
        'practice_id': _practiceId,
        'progress_poin': _progressPoin,
        'is_active': _isActive,
        'is_passed': _isPassed,
        'practice': _practiceCode?.toJson(),
      };

  int? get progressPracticeId => _progressPracticeId;
  int? get userId => _userId;
  int? get practiceId => _practiceId;
  int? get progressPoin => _progressPoin;
  bool? get isActive => _isActive;
  bool? get isPassed => _isPassed;
  PracticeCode? get practiceCode => _practiceCode;
}

class PracticeCode {
  final String? _code;

  PracticeCode({
    String? code,
  }) : _code = code;

  PracticeCode.fromJson(Map<String, dynamic> json) : _code = json['practice_code'] as String?;

  Map<String, dynamic> toJson() => {
        'practice_code': _code,
      };

  String? get code => _code;
}
