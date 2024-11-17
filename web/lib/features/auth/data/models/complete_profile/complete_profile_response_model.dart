import 'package:site_sync/features/auth/domain/entities/complete_profile/complete_profile_response_entity.dart';


class CompleteProfileResponseModel extends CompleteProfileResponseEntity {
  CompleteProfileResponseModel({
    required super.message,
  });

  factory CompleteProfileResponseModel.fromJson(final Map<String, dynamic> json) {
    return CompleteProfileResponseModel(
      message: json["message"],
    );
  }
}
