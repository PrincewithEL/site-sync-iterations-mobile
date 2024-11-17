/// message : "User registered successfully"
/// email_address : "dan.maina@"

class SignupResponseEntity {
  SignupResponseEntity({
    String? message,
    String? emailAddress,
  }) {
    _message = message;
    _emailAddress = emailAddress;
  }

  SignupResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _emailAddress = json['email_address'];
  }

  String? _message;
  String? _emailAddress;

  SignupResponseEntity copyWith({
    String? message,
    String? emailAddress,
  }) =>
      SignupResponseEntity(
        message: message ?? _message,
        emailAddress: emailAddress ?? _emailAddress,
      );

  String? get message => _message;

  String? get emailAddress => _emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['email_address'] = _emailAddress;
    return map;
  }
}
