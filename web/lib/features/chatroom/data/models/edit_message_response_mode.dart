import 'package:site_sync/features/chatroom/domain/entities/edit_message_response_entity.dart';

class EditMessageResponseModel extends EditMessageResponseEntity {
  EditMessageResponseModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory EditMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return EditMessageResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
