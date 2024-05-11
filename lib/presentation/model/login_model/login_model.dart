class LoginModel {
  final String? message;
  final User? user;
  final String? token;

  LoginModel({
    this.message,
    this.user,
    this.token,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'message': message, 'user': user?.toJson(), 'token': token};
}

class User {
  final int? userId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? birthDate;
  final String? gender;
  final String? image;

  User({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.image,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        phoneNumber = json['phone_number'] as String?,
        birthDate = json['birth_date'] as String?,
        gender = json['gender'] as String?,
        image = json['image'] as String?;

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

//https://itsallwidgets.com/json-to-dart-converter-support-null-safety