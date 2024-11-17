/// message : "Events retrieved successfully."
/// data : [{"event_id":2,"event_name":"AW in Madaraka","event_details":"abc","event_date":"2024-10-31","event_start_time":"19:50:00","event_end_time":"19:40:00","event_location":"madaraka","event_link":"","event_status":"Scheduled","created_at":"2024-10-30T20:49:48.334716+03:00","updated_at":null,"is_deleted":0,"deleted_at":null,"user":4,"project":5}]
/// status_code : 200

class EventDetailsResponseEntity {
  EventDetailsResponseEntity({
    String? message,
    List<EventDataEntity>? data,
    num? statusCode,
  }) {
    _message = message;
    _data = data;
    _statusCode = statusCode;
  }

  EventDetailsResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(EventDataEntity.fromJson(v));
      });
    }
    _statusCode = json['status_code'];
  }

  String? _message;
  List<EventDataEntity>? _data;
  num? _statusCode;

  EventDetailsResponseEntity copyWith({
    String? message,
    List<EventDataEntity>? data,
    num? statusCode,
  }) =>
      EventDetailsResponseEntity(
        message: message ?? _message,
        data: data ?? _data,
        statusCode: statusCode ?? _statusCode,
      );

  String? get message => _message;

  List<EventDataEntity>? get data => _data;

  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = _statusCode;
    return map;
  }
}

/// event_id : 2
/// event_name : "AW in Madaraka"
/// event_details : "abc"
/// event_date : "2024-10-31"
/// event_start_time : "19:50:00"
/// event_end_time : "19:40:00"
/// event_location : "madaraka"
/// event_link : ""
/// event_status : "Scheduled"
/// created_at : "2024-10-30T20:49:48.334716+03:00"
/// updated_at : null
/// is_deleted : 0
/// deleted_at : null
/// user : 4
/// project : 5

class EventDataEntity {
  EventDataEntity({
    num? eventId,
    String? eventName,
    String? eventDetails,
    String? eventDate,
    String? eventStartTime,
    String? eventEndTime,
    String? eventLocation,
    String? eventLink,
    String? eventStatus,
    String? createdAt,
    dynamic updatedAt,
    num? isDeleted,
    dynamic deletedAt,
    num? user,
    num? project,
  }) {
    _eventId = eventId;
    _eventName = eventName;
    _eventDetails = eventDetails;
    _eventDate = eventDate;
    _eventStartTime = eventStartTime;
    _eventEndTime = eventEndTime;
    _eventLocation = eventLocation;
    _eventLink = eventLink;
    _eventStatus = eventStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isDeleted = isDeleted;
    _deletedAt = deletedAt;
    _user = user;
    _project = project;
  }

  EventDataEntity.fromJson(dynamic json) {
    _eventId = json['event_id'];
    _eventName = json['event_name'];
    _eventDetails = json['event_details'];
    _eventDate = json['event_date'];
    _eventStartTime = json['event_start_time'];
    _eventEndTime = json['event_end_time'];
    _eventLocation = json['event_location'];
    _eventLink = json['event_link'];
    _eventStatus = json['event_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isDeleted = json['is_deleted'];
    _deletedAt = json['deleted_at'];
    _user = json['user'];
    _project = json['project'];
  }

  num? _eventId;
  String? _eventName;
  String? _eventDetails;
  String? _eventDate;
  String? _eventStartTime;
  String? _eventEndTime;
  String? _eventLocation;
  String? _eventLink;
  String? _eventStatus;
  String? _createdAt;
  dynamic _updatedAt;
  num? _isDeleted;
  dynamic _deletedAt;
  num? _user;
  num? _project;

  EventDataEntity copyWith({
    num? eventId,
    String? eventName,
    String? eventDetails,
    String? eventDate,
    String? eventStartTime,
    String? eventEndTime,
    String? eventLocation,
    String? eventLink,
    String? eventStatus,
    String? createdAt,
    dynamic updatedAt,
    num? isDeleted,
    dynamic deletedAt,
    num? user,
    num? project,
  }) =>
      EventDataEntity(
        eventId: eventId ?? _eventId,
        eventName: eventName ?? _eventName,
        eventDetails: eventDetails ?? _eventDetails,
        eventDate: eventDate ?? _eventDate,
        eventStartTime: eventStartTime ?? _eventStartTime,
        eventEndTime: eventEndTime ?? _eventEndTime,
        eventLocation: eventLocation ?? _eventLocation,
        eventLink: eventLink ?? _eventLink,
        eventStatus: eventStatus ?? _eventStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        isDeleted: isDeleted ?? _isDeleted,
        deletedAt: deletedAt ?? _deletedAt,
        user: user ?? _user,
        project: project ?? _project,
      );

  num? get eventId => _eventId;

  String? get eventName => _eventName;

  String? get eventDetails => _eventDetails;

  String? get eventDate => _eventDate;

  String? get eventStartTime => _eventStartTime;

  String? get eventEndTime => _eventEndTime;

  String? get eventLocation => _eventLocation;

  String? get eventLink => _eventLink;

  String? get eventStatus => _eventStatus;

  String? get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  num? get isDeleted => _isDeleted;

  dynamic get deletedAt => _deletedAt;

  num? get user => _user;

  num? get project => _project;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event_id'] = _eventId;
    map['event_name'] = _eventName;
    map['event_details'] = _eventDetails;
    map['event_date'] = _eventDate;
    map['event_start_time'] = _eventStartTime;
    map['event_end_time'] = _eventEndTime;
    map['event_location'] = _eventLocation;
    map['event_link'] = _eventLink;
    map['event_status'] = _eventStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_deleted'] = _isDeleted;
    map['deleted_at'] = _deletedAt;
    map['user'] = _user;
    map['project'] = _project;
    return map;
  }
}
