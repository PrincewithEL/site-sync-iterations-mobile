import 'package:site_sync/features/auth/domain/entities/verify_otp/verify_otp_request_entity.dart';

import '../../../domain/entities/reset_password/reset_pwd_request_entity.dart';

class VerifyOtpRequestModel extends VerifyOtpRequestEntity {
  VerifyOtpRequestModel({
    required super.otpCode,
  });

  factory VerifyOtpRequestModel.fromJson(final Map<String, dynamic> json) {
    return VerifyOtpRequestModel(
      otpCode: json["otpCode"],
    );
  }
}
