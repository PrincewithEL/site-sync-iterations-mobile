/// message : "Resources retrieved successfully."
/// status_code : 200
/// data : [{"resource_id":2,"resource_name":"blueprint for cemet.png","resource_details":"blue","resource_type":"Image","is_deleted":0,"created_at":"2024-10-30T20:47:58.299706+03:00","updated_at":null}]

class ResourceResponseEntity {
  ResourceResponseEntity({
    String? message,
    num? statusCode,
    List<ResourceDataEntity>? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  ResourceResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ResourceDataEntity.fromJson(v));
      });
    }
  }

  String? _message;
  num? _statusCode;
  List<ResourceDataEntity>? _data;

  ResourceResponseEntity copyWith({
    String? message,
    num? statusCode,
    List<ResourceDataEntity>? data,
  }) =>
      ResourceResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  List<ResourceDataEntity>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// resource_id : 2
/// resource_name : "blueprint for cemet.png"
/// resource_details : "blue"
/// resource_type : "Image"
/// is_deleted : 0
/// created_at : "2024-10-30T20:47:58.299706+03:00"
/// updated_at : null

class ResourceDataEntity {
  ResourceDataEntity({
    num? resourceId,
    String? resourceName,
    String? resourceDetails,
    String? resourceType,
    num? isDeleted,
    String? createdAt,
    dynamic updatedAt,
  }) {
    _resourceId = resourceId;
    _resourceName = resourceName;
    _resourceDetails = resourceDetails;
    _resourceType = resourceType;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ResourceDataEntity.fromJson(dynamic json) {
    _resourceId = json['resource_id'];
    _resourceName = json['resource_name'];
    _resourceDetails = json['resource_details'];
    _resourceType = json['resource_type'];
    _isDeleted = json['is_deleted'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _resourceId;
  String? _resourceName;
  String? _resourceDetails;
  String? _resourceType;
  num? _isDeleted;
  String? _createdAt;
  dynamic _updatedAt;

  ResourceDataEntity copyWith({
    num? resourceId,
    String? resourceName,
    String? resourceDetails,
    String? resourceType,
    num? isDeleted,
    String? createdAt,
    dynamic updatedAt,
  }) =>
      ResourceDataEntity(
        resourceId: resourceId ?? _resourceId,
        resourceName: resourceName ?? _resourceName,
        resourceDetails: resourceDetails ?? _resourceDetails,
        resourceType: resourceType ?? _resourceType,
        isDeleted: isDeleted ?? _isDeleted,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get resourceId => _resourceId;

  String? get resourceName => _resourceName;

  String? get resourceDetails => _resourceDetails;

  String? get resourceType => _resourceType;

  num? get isDeleted => _isDeleted;

  String? get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resource_id'] = _resourceId;
    map['resource_name'] = _resourceName;
    map['resource_details'] = _resourceDetails;
    map['resource_type'] = _resourceType;
    map['is_deleted'] = _isDeleted;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
