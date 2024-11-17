import 'package:site_sync/features/events/domain/entity/event_details_response_entity.dart';

class EventDetailsResponseModel extends EventDetailsResponseEntity {
  EventDetailsResponseModel({
    required super.message,
    required super.data,
    required super.statusCode,
  });

  factory EventDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsResponseModel(
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EventDataModel.fromJson(e))
          .toList(),
      statusCode: json['status_code'],
    );
  }
}

class EventDataModel extends EventDataEntity {
  EventDataModel({
    required super.eventId,
    required super.eventName,
    required super.eventDetails,
    required super.eventDate,
    required super.eventStartTime,
    required super.eventEndTime,
    required super.eventLocation,
    required super.eventLink,
    required super.eventStatus,
    required super.createdAt,
    required super.updatedAt,
    required super.isDeleted,
    required super.deletedAt,
    required super.user,
    required super.project,
  });

  factory EventDataModel.fromJson(Map<String, dynamic> json) {
    return EventDataModel(
      eventId: json['event_id'],
      eventName: json['event_name'],
      eventDetails: json['event_details'],
      eventDate: json['event_date'],
      eventStartTime: json['event_start_time'],
      eventEndTime: json['event_end_time'],
      eventLocation: json['event_location'],
      eventLink: json['event_link'],
      eventStatus: json['event_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isDeleted: json['is_deleted'],
      deletedAt: json['deleted_at'],
      user: json['user'],
      project: json['project'],
    );
  }
}
