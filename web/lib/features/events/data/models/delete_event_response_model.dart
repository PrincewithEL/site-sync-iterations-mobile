import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';

class DeleteEventResponseModel extends DeleteEventResponseEntity {
  DeleteEventResponseModel({
    required super.statusCode,
    required super.message,
  });

  factory DeleteEventResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteEventResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}
