/// message : "Resource added successfully."
/// status_code : 201
/// data : {"resource_id":11}

class AddResourceResponseEntity {
  AddResourceResponseEntity({
      String? message, 
      num? statusCode, 
      Data? data,}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  AddResourceResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _statusCode;
  Data? _data;
AddResourceResponseEntity copyWith({  String? message,
  num? statusCode,
  Data? data,
}) => AddResourceResponseEntity(  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  String? get message => _message;
  num? get statusCode => _statusCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// resource_id : 11

class Data {
  Data({
      num? resourceId,}){
    _resourceId = resourceId;
}

  Data.fromJson(dynamic json) {
    _resourceId = json['resource_id'];
  }
  num? _resourceId;
Data copyWith({  num? resourceId,
}) => Data(  resourceId: resourceId ?? _resourceId,
);
  num? get resourceId => _resourceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resource_id'] = _resourceId;
    return map;
  }

}