class ResetPwdResponseEntity {
  ResetPwdResponseEntity({
    String? message,
  }) {
    _message = message;
  }

  ResetPwdResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  ResetPwdResponseEntity copyWith({
    String? email,
  }) =>
      ResetPwdResponseEntity(
        message: email ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
