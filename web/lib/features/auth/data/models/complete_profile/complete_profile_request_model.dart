import 'package:site_sync/features/auth/domain/entities/complete_profile/complete_profile_request_entity.dart';

class CompleteProfileRequestModel extends CompleteProfileRequestEntity {
  CompleteProfileRequestModel({
    required super.userType,
    required super.profilePicture,
  });

  factory CompleteProfileRequestModel.fromJson(final Map<String, dynamic> json) {
    return CompleteProfileRequestModel(
      userType: json["user_type"],
      profilePicture: json["profile_picture"],
    );
  }
}
