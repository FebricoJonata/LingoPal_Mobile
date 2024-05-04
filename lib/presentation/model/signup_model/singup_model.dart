class SignUp {
  final String? message;
  final List<Data>? data;

  SignUp({
    this.message,
    this.data,
  });

  SignUp.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.map((e) => e.toJson()).toList()};
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
