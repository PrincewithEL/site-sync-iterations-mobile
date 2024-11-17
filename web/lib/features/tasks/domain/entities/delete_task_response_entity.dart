/// message : "Task and associated transactions deleted successfully."
/// status_code : 200

class DeleteTaskResponseEntity {
  DeleteTaskResponseEntity({
    String? message,
    num? statusCode,
  }) {
    _message = message;
    _statusCode = statusCode;
  }

  DeleteTaskResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
  }

  String? _message;
  num? _statusCode;

  DeleteTaskResponseEntity copyWith({
    String? message,
    num? statusCode,
  }) =>
      DeleteTaskResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    return map;
  }
}