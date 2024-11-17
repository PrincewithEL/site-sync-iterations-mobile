class SignInRequestEntity {
  String? _identifier;
  String? _password;

  SignInRequestEntity({
    required String? identifier,
    required String? password,
  }) {
    _identifier = identifier;
    _password = password;
  }

  SignInRequestEntity.fromJson(dynamic json) {
    _identifier = json['identifier'];
    _password = json['password'];
  }

  SignInRequestEntity copyWith({
    required String? identifier,
    required String? password,
  }) =>
      SignInRequestEntity(
        identifier: identifier ?? _identifier,
        password: password ?? _password,
      );

  String? get identifier => _identifier;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = _identifier;
    map['password'] = _password;
    return map;
  }
}
