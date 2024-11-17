import 'package:site_sync/features/auth/domain/entities/signup/signup_request_entity.dart';

class SignUpRequestModel extends SignUpRequestEntity {
  SignUpRequestModel({
    required super.fullname,
    required super.emailAddress,
    required super.password,
    required super.phoneNumber,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      fullname: json['fullname'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      password: json['password'],
    );
  }
}
