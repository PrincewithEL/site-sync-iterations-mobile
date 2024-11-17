import 'package:site_sync/features/auth/domain/entities/reset_password/reset_pwd_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/verify_otp/verify_otp_response_entity.dart';

import '../../../domain/entities/reset_password/reset_pwd_request_entity.dart';

class VerifyOtpResponseModel extends VerifyOtpResponseEntity {
  VerifyOtpResponseModel({
    required super.message,
  });

  factory VerifyOtpResponseModel.fromJson(final Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      message: json["message"],
    );
  }
}
