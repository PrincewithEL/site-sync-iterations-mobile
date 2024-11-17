/// message : "Message sent successfully."
/// status_code : 201
/// data : {}

class SendMessageResponseEntity {
  SendMessageResponseEntity({
      String? message, 
      num? statusCode, 
      dynamic data,}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  SendMessageResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'];
  }
  String? _message;
  num? _statusCode;
  dynamic _data;
SendMessageResponseEntity copyWith({  String? message,
  num? statusCode,
  dynamic data,
}) => SendMessageResponseEntity(  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  String? get message => _message;
  num? get statusCode => _statusCode;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    map['data'] = _data;
    return map;
  }

}