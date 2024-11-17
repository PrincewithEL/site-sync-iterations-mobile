class ResetPwdRequestEntity {
  ResetPwdRequestEntity({
    String? email,
  }) {
    _email = email;
  }

  ResetPwdRequestEntity.fromJson(dynamic json) {
    _email = json['email'];
  }

  String? _email;

  ResetPwdRequestEntity copyWith({
    String? email,
  }) =>
      ResetPwdRequestEntity(
        email: email ?? _email,
      );

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }
}
