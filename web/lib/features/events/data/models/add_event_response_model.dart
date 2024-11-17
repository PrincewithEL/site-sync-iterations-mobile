import 'package:site_sync/features/events/domain/entity/add_event_response_entity.dart';

class AddEventResponseModel extends AddEventResponseEntity {
  AddEventResponseModel({
    required super.statusCode,
    required super.message,
  });

  factory AddEventResponseModel.fromJson(Map<String, dynamic> json) {
    return AddEventResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}
