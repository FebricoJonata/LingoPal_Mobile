class EmailVerif {
  final int? status;
  final String? message;

  EmailVerif({
    this.status,
    this.message,
  });

  EmailVerif.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
