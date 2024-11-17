/// status_code : 400
/// message : "Invalid email or password."
/// data : {}

class SiteSyncError {
  num? _statusCode;
  String? _message;
  dynamic _data;

  num? get statusCode => _statusCode;

  String? get message => _message;

  dynamic get data => _data;

  SiteSyncError({
    num? statusCode,
    String? message,
    dynamic data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  SiteSyncError.fromJson(dynamic json) {
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'];
  }

  SiteSyncError copyWith({
    num? statusCode,
    String? message,
    dynamic data,
  }) =>
      SiteSyncError(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        data: data ?? _data,
      );


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = _statusCode;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
