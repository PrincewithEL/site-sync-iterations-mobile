/// fullname : "Dan Maina"
/// email_address : "dan.maina@"
/// password : "12345Dan.."
/// phone_number : "0712345678"

class SignUpRequestEntity {
  SignUpRequestEntity({
    String? fullname,
    String? emailAddress,
    String? password,
    String? phoneNumber,
  }) {
    _fullname = fullname;
    _emailAddress = emailAddress;
    _password = password;
    _phoneNumber = phoneNumber;
  }

  SignUpRequestEntity.fromJson(dynamic json) {
    _fullname = json['fullname'];
    _emailAddress = json['email_address'];
    _password = json['password'];
    _phoneNumber = json['phone_number'];
  }

  String? _fullname;
  String? _emailAddress;
  String? _password;
  String? _phoneNumber;

  SignUpRequestEntity copyWith({
    String? fullname,
    String? emailAddress,
    String? password,
    String? phoneNumber,
  }) =>
      SignUpRequestEntity(
        fullname: fullname ?? _fullname,
        emailAddress: emailAddress ?? _emailAddress,
        password: password ?? _password,
        phoneNumber: phoneNumber ?? _phoneNumber,
      );

  String? get fullname => _fullname;

  String? get emailAddress => _emailAddress;

  String? get password => _password;

  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = _fullname;
    map['email_address'] = _emailAddress;
    map['password'] = _password;
    map['phone_number'] = _phoneNumber;
    return map;
  }
}
