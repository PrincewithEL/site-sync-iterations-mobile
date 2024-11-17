import 'package:site_sync/features/chatroom/domain/entities/send_message_response_entity.dart';

class SendMessageResponseModel extends SendMessageResponseEntity {
  SendMessageResponseModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory SendMessageResponseModel.fromJson(final Map<String, dynamic> json) {
    return SendMessageResponseModel(
      data: json["data"],
      message: json["message"],
      statusCode: json["status_code"],
    );
  }
}
