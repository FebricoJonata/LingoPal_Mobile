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
//   final List<ProfileData>? data;
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
//         data = (json['data'] as List?)?.map((dynamic e) => ProfileData.fromJson(e as Map<String, dynamic>)).toList(),
//         count = json['count'],
//         status = json['status'] as int?,
//         statusText = json['statusText'] as String?;

//   Map<String, dynamic> toJson() => {'error': error, 'data': data?.map((e) => e.toJson()).toList(), 'count': count, 'status': status, 'statusText': statusText};
// }

// class ProfileData {
//   final int? userId;
//   final String? name;
//   final String? email;
//   final String? phoneNumber;
//   final String? birthDate;
//   final String? gender;
//   final String? image;

//   ProfileData({
//     this.userId,
//     this.name,
//     this.email,
//     this.phoneNumber,
//     this.birthDate,
//     this.gender,
//     this.image,
//   });

//   ProfileData.fromJson(Map<String, dynamic> json)
//       : userId = json['user_id'] as int?,
//         name = json['name'] as String?,
//         email = json['email'] as String?,
//         phoneNumber = json['phone_number'] as String?,
//         birthDate = json['birth_date'] as String?,
//         gender = json['gender'] as String?,
//         image = json['image'] as String?;

//   Map<String, dynamic> toJson() => {'user_id': userId, 'name': name, 'email': email, 'phone_number': phoneNumber, 'birth_date': birthDate, 'gender': gender, 'image': image};
// }

// ignore_for_file: unnecessary_getters_setters

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
  List<ProfileData>? _data; // Private
  dynamic _count; // Private
  int? _status; // Private
  String? _statusText; // Private

  Body({
    dynamic error,
    List<ProfileData>? data,
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
  List<ProfileData>? get data => _data;
  dynamic get count => _count;
  int? get status => _status;
  String? get statusText => _statusText;

  // Setters
  set error(dynamic value) => _error = value;
  set data(List<ProfileData>? value) => _data = value;
  set count(dynamic value) => _count = value;
  set status(int? value) => _status = value;
  set statusText(String? value) => _statusText = value;

  Body.fromJson(Map<String, dynamic> json)
      : _error = json['error'],
        _data = (json['data'] as List?)?.map((dynamic e) => ProfileData.fromJson(e as Map<String, dynamic>)).toList(),
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

class ProfileData {
  int? _userId;
  String? _name;
  String? _email;
  String? _birthDate;
  String? _image;

  ProfileData({
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

  ProfileData.fromJson(Map<String, dynamic> json)
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
        'image': _image,
      };
}
