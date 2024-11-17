class VerifyOtpRequestEntity {
  VerifyOtpRequestEntity({
    String? otpCode,
  }) {
    _otpCode = otpCode;
  }

  VerifyOtpRequestEntity.fromJson(dynamic json) {
    _otpCode = json['otpCode'];
  }

  String? _otpCode;

  VerifyOtpRequestEntity copyWith({
    String? email,
  }) =>
      VerifyOtpRequestEntity(
        otpCode: email ?? _otpCode,
      );

  String? get otpCode => _otpCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otpCode'] = _otpCode;
    return map;
  }
}
