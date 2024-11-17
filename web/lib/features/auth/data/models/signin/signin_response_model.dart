import 'package:site_sync/features/auth/domain/entities/signin/signin_response_entity.dart';

class SignInResponseModel extends SignInResponseEntity {
  SignInResponseModel({
    required super.message,
    required super.statusCode,
    required super.data,
  });

  factory SignInResponseModel.fromJson(final Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json['message'],
      statusCode: json['status_code'],
      data: UserDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class UserDetailsModel extends UserDetailsEntity {
  UserDetailsModel({
    required super.userId,
    required super.fullname,
    required super.emailAddress,
    required super.profilePicture,
    required super.userType,
  });

  factory UserDetailsModel.fromJson(final Map<String, dynamic> json) {
    return UserDetailsModel(
      userId: json['user_id'],
      fullname: json['fullname'],
      emailAddress: json['email_address'],
      profilePicture: json['profile_picture'],
      userType: json['user_type'],
    );
  }
}
