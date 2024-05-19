class PracticeProgressModel {
  final int? status;
  final List<PracticeProgress>? body;

  PracticeProgressModel({
    this.status,
    this.body,
  });

  PracticeProgressModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      body = (json['body'] as List?)?.map((dynamic e) => PracticeProgress.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'body' : body?.map((e) => e.toJson()).toList()
  };
}

class PracticeProgress {
  final int? progressPracticeId;
  final int? userId;
  final int? practiceId;
  final int? progressPoin;
  final bool? isActive;
  final bool? isPassed;
  final PracticeCode? practice;

  PracticeProgress({
    this.progressPracticeId,
    this.userId,
    this.practiceId,
    this.progressPoin,
    this.isActive,
    this.isPassed,
    this.practice,
  });

  PracticeProgress.fromJson(Map<String, dynamic> json)
    : progressPracticeId = json['progress_practice_id'] as int?,
      userId = json['user_id'] as int?,
      practiceId = json['practice_id'] as int?,
      progressPoin = json['progress_poin'] as int?,
      isActive = json['is_active'] as bool?,
      isPassed = json['is_passed'] as bool?,
      practice = (json['practice'] as Map<String,dynamic>?) != null ? PracticeCode.fromJson(json['practice'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'progress_practice_id' : progressPracticeId,
    'user_id' : userId,
    'practice_id' : practiceId,
    'progress_poin' : progressPoin,
    'is_active' : isActive,
    'is_passed' : isPassed,
    'practice' : practice?.toJson()
  };
}

class PracticeCode {
  final String? practiceCode;

  PracticeCode({
    this.practiceCode,
  });

  PracticeCode.fromJson(Map<String, dynamic> json)
    : practiceCode = json['practice_code'] as String?;

  Map<String, dynamic> toJson() => {
    'practice_code' : practiceCode
  };
}