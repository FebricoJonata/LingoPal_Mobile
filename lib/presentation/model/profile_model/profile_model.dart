class Profile {
  final int? status;
  final Body? body;

  Profile({
    this.status,
    this.body,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        body = (json['body'] as Map<String, dynamic>?) != null
            ? Body.fromJson(json['body'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'body': body?.toJson()};
}

class Body {
  final dynamic error;
  final List<Data>? data;
  final dynamic count;
  final int? status;
  final String? statusText;

  Body({
    this.error,
    this.data,
    this.count,
    this.status,
    this.statusText,
  });

  Body.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
        count = json['count'],
        status = json['status'] as int?,
        statusText = json['statusText'] as String?;

  Map<String, dynamic> toJson() => {
        'error': error,
        'data': data?.map((e) => e.toJson()).toList(),
        'count': count,
        'status': status,
        'statusText': statusText
      };
}

class Data {
  final int? userId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? birthDate;
  final String? gender;
  final dynamic image;

  Data({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.image,
  });

  Data.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        phoneNumber = json['phone_number'] as String?,
        birthDate = json['birth_date'] as String?,
        gender = json['gender'] as String?,
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'birth_date': birthDate,
        'gender': gender,
        'image': image
      };
}
