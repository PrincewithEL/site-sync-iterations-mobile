/// message : "Event added successfully."
/// status_code : 201

class AddEventResponseEntity {
  AddEventResponseEntity({
      String? message, 
      num? statusCode,}){
    _message = message;
    _statusCode = statusCode;
}

  AddEventResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
  }
  String? _message;
  num? _statusCode;
AddEventResponseEntity copyWith({  String? message,
  num? statusCode,
}) => AddEventResponseEntity(  message: message ?? _message,
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