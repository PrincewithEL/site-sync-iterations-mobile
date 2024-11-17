/// user_id : "1"
/// event_name : "Team Meeting"
/// event_details : "Discuss project updates and next steps."
/// event_date : "2024-11-01"
/// event_start_time : "10:00"
/// event_end_time : "11:00"
/// event_location : "Conference Room A"
/// event_link : "http://example.com/event-link"

class AddEventRequestEntity {
  AddEventRequestEntity({
    String? userId,
    String? eventName,
    String? eventDetails,
    String? eventDate,
    String? eventStartTime,
    String? eventEndTime,
    String? eventLocation,
    String? eventLink,
  }) {
    _userId = userId;
    _eventName = eventName;
    _eventDetails = eventDetails;
    _eventDate = eventDate;
    _eventStartTime = eventStartTime;
    _eventEndTime = eventEndTime;
    _eventLocation = eventLocation;
    _eventLink = eventLink;
  }

  AddEventRequestEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _eventName = json['event_name'];
    _eventDetails = json['event_details'];
    _eventDate = json['event_date'];
    _eventStartTime = json['event_start_time'];
    _eventEndTime = json['event_end_time'];
    _eventLocation = json['event_location'];
    _eventLink = json['event_link'];
  }

  String? _userId;
  String? _eventName;
  String? _eventDetails;
  String? _eventDate;
  String? _eventStartTime;
  String? _eventEndTime;
  String? _eventLocation;
  String? _eventLink;

  AddEventRequestEntity copyWith({
    String? userId,
    String? eventName,
    String? eventDetails,
    String? eventDate,
    String? eventStartTime,
    String? eventEndTime,
    String? eventLocation,
    String? eventLink,
  }) =>
      AddEventRequestEntity(
        userId: userId ?? _userId,
        eventName: eventName ?? _eventName,
        eventDetails: eventDetails ?? _eventDetails,
        eventDate: eventDate ?? _eventDate,
        eventStartTime: eventStartTime ?? _eventStartTime,
        eventEndTime: eventEndTime ?? _eventEndTime,
        eventLocation: eventLocation ?? _eventLocation,
        eventLink: eventLink ?? _eventLink,
      );

  String? get userId => _userId;

  String? get eventName => _eventName;

  String? get eventDetails => _eventDetails;

  String? get eventDate => _eventDate;

  String? get eventStartTime => _eventStartTime;

  String? get eventEndTime => _eventEndTime;

  String? get eventLocation => _eventLocation;

  String? get eventLink => _eventLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['event_name'] = _eventName;
    map['event_details'] = _eventDetails;
    map['event_date'] = _eventDate;
    map['event_start_time'] = _eventStartTime;
    map['event_end_time'] = _eventEndTime;
    map['event_location'] = _eventLocation;
    map['event_link'] = _eventLink;
    return map;
  }
}
