import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';

class DeleteMessageResponseModel extends DeleteMessageResponseEntity {
  DeleteMessageResponseModel({
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory DeleteMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteMessageResponseModel(
      statusCode: json['status_code'],
      data: json['data'],
      message: json['message'],
    );
  }
}
