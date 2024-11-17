import 'package:site_sync/features/auth/domain/entities/signin/signin_request_entity.dart';

class SignInRequestModel extends SignInRequestEntity {

  SignInRequestModel({
    required super.identifier,
    required super.password,
  });

  factory SignInRequestModel.fromJson(final Map<String, dynamic> json) {
    return SignInRequestModel(identifier: json["identifier"], password: json["password"]);
  }

}
