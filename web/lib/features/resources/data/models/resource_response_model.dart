import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';

class ResourceResponseModel extends ResourceResponseEntity {
  ResourceResponseModel({
    required super.statusCode,
    required super.message,
    required super.data,
  });

  factory ResourceResponseModel.fromJson(Map<String, dynamic> json) {
    return ResourceResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
      data: List<ResourceDataModel>.from(
        json['data'].map((x) => ResourceDataModel.fromJson(x)),
      ),
    );
  }
}

class ResourceDataModel extends ResourceDataEntity {
  ResourceDataModel({
    required super.isDeleted,
    required super.resourceDetails,
    required super.resourceId,
    required super.resourceName,
    required super.resourceType,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ResourceDataModel.fromJson(Map<String, dynamic> json) {
    return ResourceDataModel(
      isDeleted: json['is_deleted'],
      resourceDetails: json['resource_details'],
      resourceId: json['resource_id'],
      resourceName: json['resource_name'],
      resourceType: json['resource_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
