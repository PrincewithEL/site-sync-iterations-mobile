/// user_id : "1"
/// resource_name : "test"
/// resource_details : "this is a test"
/// resource_file : ""

class AddResourceEntity {
  AddResourceEntity({
    String? userId,
    String? resourceName,
    String? resourceDetails,
    String? resourceFile,
  }) {
    _userId = userId;
    _resourceName = resourceName;
    _resourceDetails = resourceDetails;
    _resourceFile = resourceFile;
  }

  AddResourceEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _resourceName = json['resource_name'];
    _resourceDetails = json['resource_details'];
    _resourceFile = json['resource_file'];
  }

  String? _userId;
  String? _resourceName;
  String? _resourceDetails;
  String? _resourceFile;

  AddResourceEntity copyWith({
    String? userId,
    String? resourceName,
    String? resourceDetails,
    String? resourceFile,
  }) =>
      AddResourceEntity(
        userId: userId ?? _userId,
        resourceName: resourceName ?? _resourceName,
        resourceDetails: resourceDetails ?? _resourceDetails,
        resourceFile: resourceFile ?? _resourceFile,
      );

  String? get userId => _userId;

  String? get resourceName => _resourceName;

  String? get resourceDetails => _resourceDetails;

  String? get resourceFile => _resourceFile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['resource_name'] = _resourceName;
    map['resource_details'] = _resourceDetails;
    map['resource_file'] = _resourceFile;
    return map;
  }
}
