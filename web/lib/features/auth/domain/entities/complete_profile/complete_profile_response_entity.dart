/// user_type : "Client"
/// profile_picture : ""

class CompleteProfileResponseEntity {
  CompleteProfileResponseEntity({
    String? message,
  }) {
    _message = message;
  }

  CompleteProfileResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  CompleteProfileResponseEntity copyWith({
    String? message,
  }) =>
      CompleteProfileResponseEntity(
        message: message ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
