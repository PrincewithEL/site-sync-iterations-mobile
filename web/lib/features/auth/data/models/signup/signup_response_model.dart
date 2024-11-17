import 'package:site_sync/features/auth/domain/entities/signup/signup_response_entity.dart';

/// message : "User registered successfully"
/// email_address : "dan.maina@"

class SignupResponseModel extends SignupResponseEntity {
  SignupResponseModel({
    required super.message,
    required super.emailAddress,
  });

  factory SignupResponseModel.fromJson(final Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'],
      emailAddress: json['email_address'],
    );
  }
}
