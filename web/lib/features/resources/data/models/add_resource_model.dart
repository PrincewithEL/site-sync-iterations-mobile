import 'package:dio/dio.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_entity.dart';

class AddResourceModel extends AddResourceEntity {
  AddResourceModel({
    required super.resourceFile,
    required super.resourceDetails,
    required super.resourceName,
    required super.userId,
  });

  factory AddResourceModel.fromJson(Map<String, dynamic> json) {
    return AddResourceModel(
      resourceFile: json['resourceFile'],
      resourceDetails: json['resourceDetails'],
      resourceName: json['resourceName'],
      userId: json['userId'],
    );
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'resourceFile': resourceFile,
      'resourceDetails': resourceDetails,
      'resourceName': resourceName,
      'userId': userId,
    });
  }

}
