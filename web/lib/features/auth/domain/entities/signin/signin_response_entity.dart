/// message : "Welcome Asher Njoroge"
/// user_details : {"fullname":"Asher Njoroge","email_address":"asher.njoroge@","profile_picture":"https://site-sync-iterations.onrender.com/media/profile_pictures/a703e704-a088-4da0-a890-c571863d6915.jpg","user_type":"Client"}

class SignInResponseEntity {
  String? _message;
  int? _statusCode;
  UserDetailsEntity? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  UserDetailsEntity? get data => _data;

  SignInResponseEntity({
    String? message,
    int? statusCode,
    UserDetailsEntity? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  SignInResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'] != null
        ? UserDetailsEntity.fromJson(
            json['data'],
          )
        : null;
  }

  SignInResponseEntity copyWith({
    String? message,
    int? statusCode,
    UserDetailsEntity? data,
  }) =>
      SignInResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// fullname : "Asher Njoroge"
/// email_address : "asher.njoroge@"
/// profile_picture : "https://site-sync-iterations.onrender.com/media/profile_pictures/a703e704-a088-4da0-a890-c571863d6915.jpg"
/// user_type : "Client"

class UserDetailsEntity {
  UserDetailsEntity({
    String? fullname,
    int? userId,
    String? emailAddress,
    String? profilePicture,
    String? userType,
  }) {
    _fullname = fullname;
    _userId = userId;
    _emailAddress = emailAddress;
    _profilePicture = profilePicture;
    _userType = userType;
  }

  UserDetailsEntity.fromJson(dynamic json) {
    _fullname = json['fullname'];
    _userId = json['user_id'];
    _emailAddress = json['email_address'];
    _profilePicture = json['profile_picture'];
    _userType = json['user_type'];
  }

  int? _userId;
  String? _fullname;
  String? _emailAddress;
  String? _profilePicture;
  String? _userType;

  UserDetailsEntity copyWith({
    String? fullname,
    String? emailAddress,
    String? profilePicture,
    String? userType,
  }) =>
      UserDetailsEntity(
        fullname: fullname ?? _fullname,
        emailAddress: emailAddress ?? _emailAddress,
        profilePicture: profilePicture ?? _profilePicture,
        userType: userType ?? _userType,
      );

  String? get fullname => _fullname;

  int? get userId => _userId;

  String? get emailAddress => _emailAddress;

  String? get profilePicture => _profilePicture;

  String? get userType => _userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = _fullname;
    map['email_address'] = _emailAddress;
    map['profile_picture'] = _profilePicture;
    map['user_type'] = _userType;
    return map;
  }
}
