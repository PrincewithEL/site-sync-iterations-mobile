/// message : "Welcome to the test project..."
/// reply_message_id : null

class SendMessageRequestEntity {
  SendMessageRequestEntity({
    String? message,
    String? userId,
    dynamic replyMessageId,
  }) {
    _message = message;
    _userId = userId;
    _replyMessageId = replyMessageId;
  }

  SendMessageRequestEntity.fromJson(dynamic json) {
    _message = json['message'];
    _userId = json['user_id'];
    _replyMessageId = json['reply_message_id'];
  }

  String? _message;
  String? _userId;
  dynamic _replyMessageId;

  SendMessageRequestEntity copyWith({
    String? message,
    String? userId,
    dynamic replyMessageId,
  }) =>
      SendMessageRequestEntity(
        userId: userId ?? _userId,
        message: message ?? _message,
        replyMessageId: replyMessageId ?? _replyMessageId,
      );

  String? get message => _message;

  String? get userId => _userId;

  dynamic get replyMessageId => _replyMessageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['user_id'] = _userId;
    map['reply_message_id'] = _replyMessageId;
    return map;
  }
}
