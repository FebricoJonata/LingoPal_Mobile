// class Profile {
//   final int? status;
//   final Body? body;

//   Profile({
//     this.status,
//     this.body,
//   });

//   Profile.fromJson(Map<String, dynamic> json)
//       : status = json['status'] as int?,
//         body = (json['body'] as Map<String, dynamic>?) != null ? Body.fromJson(json['body'] as Map<String, dynamic>) : null;

//   Map<String, dynamic> toJson() => {'status': status, 'body': body?.toJson()};
// }

// class Body {
//   final dynamic error;
//   final List<Data>? data;
//   final dynamic count;
//   final int? status;
//   final String? statusText;

//   Body({
//     this.error,
//     this.data,
//     this.count,
//     this.status,
//     this.statusText,
//   });

//   Body.fromJson(Map<String, dynamic> json)
//       : error = json['error'],
//         data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
//         count = json['count'],
//         status = json['status'] as int?,
//         statusText = json['statusText'] as String?;

//   Map<String, dynamic> toJson() => {'error': error, 'data': data?.map((e) => e.toJson()).toList(), 'count': count, 'status': status, 'statusText': statusText};
// }

// class Data {
//   final int? userId;
//   final String? name;
//   final String? email;
//   final String? phoneNumber;
//   final String? birthDate;
//   final String? gender;
//   final String? image;

//   Data({
//     this.userId,
//     this.name,
//     this.email,
//     this.phoneNumber,
//     this.birthDate,
//     this.gender,
//     this.image,
//   });

//   Data.fromJson(Map<String, dynamic> json)
//       : userId = json['user_id'] as int?,
//         name = json['name'] as String?,
//         email = json['email'] as String?,
//         phoneNumber = json['phone_number'] as String?,
//         birthDate = json['birth_date'] as String?,
//         gender = json['gender'] as String?,
//         image = json['image'] as String?;

//   Map<String, dynamic> toJson() => {'user_id': userId, 'name': name, 'email': email, 'phone_number': phoneNumber, 'birth_date': birthDate, 'gender': gender, 'image': image};
// }

class Profile {
  int? _status; // Private
  Body? _body; // Private

  Profile({
    int? status,
    Body? body,
  })  : _status = status,
        _body = body;

  // Getters
  int? get status => _status;
  Body? get body => _body;

  // Setters
  set status(int? value) => _status = value;
  set body(Body? value) => _body = value;

  Profile.fromJson(Map<String, dynamic> json)
      : _status = json['status'] as int?,
        _body = (json['body'] as Map<String, dynamic>?) != null ? Body.fromJson(json['body'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'status': _status, 'body': _body?.toJson()};
}

class Body {
  dynamic _error; // Private
  List<Data>? _data; // Private
  dynamic _count; // Private
  int? _status; // Private
  String? _statusText; // Private

  Body({
    dynamic error,
    List<Data>? data,
    dynamic count,
    int? status,
    String? statusText,
  })  : _error = error,
        _data = data,
        _count = count,
        _status = status,
        _statusText = statusText;

  // Getters
  dynamic get error => _error;
  List<Data>? get data => _data;
  dynamic get count => _count;
  int? get status => _status;
  String? get statusText => _statusText;

  // Setters
  set error(dynamic value) => _error = value;
  set data(List<Data>? value) => _data = value;
  set count(dynamic value) => _count = value;
  set status(int? value) => _status = value;
  set statusText(String? value) => _statusText = value;

  Body.fromJson(Map<String, dynamic> json)
      : _error = json['error'],
        _data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
        _count = json['count'],
        _status = json['status'] as int?,
        _statusText = json['statusText'] as String?;

  Map<String, dynamic> toJson() => {
        'error': _error,
        'data': _data?.map((e) => e.toJson()).toList(),
        'count': _count,
        'status': _status,
        'statusText': _statusText,
      };
}

class Data {
  int? _userId;
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _birthDate;
  String? _gender;
  String? _image;

  Data({
    int? userId,
    String? name,
    String? email,
    String? phoneNumber,
    String? birthDate,
    String? gender,
    String? image,
  })  : _userId = userId,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _birthDate = birthDate,
        _gender = gender,
        _image = image;

  // Getters
  int? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get birthDate => _birthDate;
  String? get gender => _gender;
  String? get image => _image;

  // Setters
  set userId(int? value) => _userId = value;
  set name(String? value) => _name = value;
  set email(String? value) => _email = value;
  set phoneNumber(String? value) => _phoneNumber = value;
  set birthDate(String? value) => _birthDate = value;
  set gender(String? value) => _gender = value;
  set image(String? value) => _image = value;

  Data.fromJson(Map<String, dynamic> json)
      : _userId = json['user_id'] as int?,
        _name = json['name'] as String?,
        _email = json['email'] as String?,
        _phoneNumber = json['phone_number'] as String?,
        _birthDate = json['birth_date'] as String?,
        _gender = json['gender'] as String?,
        _image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'user_id': _userId,
        'name': _name,
        'email': _email,
        'phone_number': _phoneNumber,
        'birth_date': _birthDate,
        'gender': _gender,
        'image': _image,
      };
}
