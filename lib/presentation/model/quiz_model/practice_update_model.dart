class PracticeUpdate {
  final int? status;
  final List<Body>? body;

  PracticeUpdate({
    this.status,
    this.body,
  });

  PracticeUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as List?)?.map((dynamic e) => Body.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.map((e) => e.toJson()).toList()};
}

class Body {
  final int? progressPracticeId;
  final int? userId;
  final int? practiceId;
  final int? progressPoin;
  final bool? isActive;
  final bool? isPassed;

  Body({
    this.progressPracticeId,
    this.userId,
    this.practiceId,
    this.progressPoin,
    this.isActive,
    this.isPassed,
  });

  Body.fromJson(Map<String, dynamic> json)
      : progressPracticeId = json['progress_practice_id'] as int?,
        userId = json['user_id'] as int?,
        practiceId = json['practice_id'] as int?,
        progressPoin = json['progress_poin'] as int?,
        isActive = json['is_active'] as bool?,
        isPassed = json['is_passed'] as bool?;

  Map<String, dynamic> toJson() =>
      {'progress_practice_id': progressPracticeId, 'user_id': userId, 'practice_id': practiceId, 'progress_poin': progressPoin, 'is_active': isActive, 'is_passed': isPassed};
}
