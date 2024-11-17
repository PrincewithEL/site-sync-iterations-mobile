import 'package:site_sync/features/chatroom/domain/entities/send_message_request_entity.dart';

class SendMessageRequestModel extends SendMessageRequestEntity {
  SendMessageRequestModel({
    required super.userId,
    required super.message,
    required super.replyMessageId,
  });

  factory SendMessageRequestModel.fromJson(final Map<String, dynamic> json) {
    return SendMessageRequestModel(
      message: json["message"],
      userId: json["user_id"],
      replyMessageId: json["reply_message_id"],
    );
  }
}
