/// status_code : 200
/// message : "You have exited the project successfully."
/// data : {}

class LeaveProjectResponseEntity {
  LeaveProjectResponseEntity({
    num? statusCode,
    String? message,
    dynamic data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  LeaveProjectResponseEntity.fromJson(dynamic json) {
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'];
  }

  num? _statusCode;
  String? _message;
  dynamic _data;

  LeaveProjectResponseEntity copyWith({
    num? statusCode,
    String? message,
    dynamic data,
  }) =>
      LeaveProjectResponseEntity(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get statusCode => _statusCode;

  String? get message => _message;

  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = _statusCode;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
