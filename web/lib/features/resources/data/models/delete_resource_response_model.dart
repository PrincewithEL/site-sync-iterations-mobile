import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';

class DeleteResourceResponseModel extends DeleteResponseResponseEntity {
  DeleteResourceResponseModel({
    required super.message,
    required super.statusCode,
  });

  factory DeleteResourceResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteResourceResponseModel(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
