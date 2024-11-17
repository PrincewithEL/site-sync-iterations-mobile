import 'package:site_sync/features/events/domain/entity/add_event_request_entity.dart';

class AddEventRequestModel extends AddEventRequestEntity {
  AddEventRequestModel({
    required super.userId,
    required super.eventName,
    required super.eventDetails,
    required super.eventDate,
    required super.eventStartTime,
    required super.eventEndTime,
    required super.eventLocation,
    required super.eventLink,
  });

  factory AddEventRequestModel.fromJson(Map<String, dynamic> json) {
    return AddEventRequestModel(
      userId: json['user_id'],
      eventName: json['event_name'],
      eventDetails: json['event_details'],
      eventDate: json['event_date'],
      eventStartTime: json['event_start_time'],
      eventEndTime: json['event_end_time'],
      eventLocation: json['event_location'],
      eventLink: json['event_link'],
    );
  }
}