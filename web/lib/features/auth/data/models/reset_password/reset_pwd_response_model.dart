import 'package:site_sync/features/auth/domain/entities/reset_password/reset_pwd_response_entity.dart';

import '../../../domain/entities/reset_password/reset_pwd_request_entity.dart';

class ResetPasswordResponseModel extends ResetPwdResponseEntity {
  ResetPasswordResponseModel({
    required super.message,
  });

  factory ResetPasswordResponseModel.fromJson(final Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      message: json["message"],
    );
  }
}
