import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';

class AddResourceResponseModel extends AddResourceResponseEntity {
  AddResourceResponseModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory AddResourceResponseModel.fromJson(Map<String, dynamic> json) {
    return AddResourceResponseModel(
      message: json['message'],
      statusCode: json['status_code'],
      data: json['data'],
    );
  }
}
