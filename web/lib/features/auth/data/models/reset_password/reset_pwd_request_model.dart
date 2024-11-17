import '../../../domain/entities/reset_password/reset_pwd_request_entity.dart';

class ResetPasswordRequestModel extends ResetPwdRequestEntity {
  ResetPasswordRequestModel({
    required super.email,
  });

  factory ResetPasswordRequestModel.fromJson(final Map<String, dynamic> json) {
    return ResetPasswordRequestModel(
      email: json["email"],
    );
  }
}
