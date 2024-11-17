class VerifyOtpResponseEntity {
  VerifyOtpResponseEntity({
    String? message,
  }) {
    _message = message;
  }

  VerifyOtpResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  VerifyOtpResponseEntity copyWith({
    String? email,
  }) =>
      VerifyOtpResponseEntity(
        message: email ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
