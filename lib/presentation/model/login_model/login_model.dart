class LoginModel {
  String? _message;
  User? _user;
  String? _token;

  LoginModel({
    String? message,
    User? user,
    String? token,
  })  : _message = message,
        _user = user,
        _token = token;

  // Getters
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;

  // Setters
  set message(String? value) => _message = value;
  set user(User? value) => _user = value;
  set token(String? value) => _token = value;

  LoginModel.fromJson(Map<String, dynamic> json)
      : _message = json['message'] as String?,
        _user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        _token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'message': _message, 'user': _user?.toJson(), 'token': _token};
}

class User {
  int? _userId;
  String? _name;
  String? _email;
  String? _birthDate;
  String? _image;

  User({
    int? userId,
    String? name,
    String? email,
    String? birthDate,
    String? image,
  })  : _userId = userId,
        _name = name,
        _email = email,
        _birthDate = birthDate,
        _image = image;

  // Getters
  int? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get birthDate => _birthDate;
  String? get image => _image;

  // Setters
  set userId(int? value) => _userId = value;
  set name(String? value) => _name = value;
  set email(String? value) => _email = value;
  set birthDate(String? value) => _birthDate = value;
  set image(String? value) => _image = value;

  User.fromJson(Map<String, dynamic> json)
      : _userId = json['user_id'] as int?,
        _name = json['name'] as String?,
        _email = json['email'] as String?,
        _birthDate = json['birth_date'] as String?,
        _image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'user_id': _userId,
        'name': _name,
        'email': _email,
        'birth_date': _birthDate,
        'image': _image
      };
}
