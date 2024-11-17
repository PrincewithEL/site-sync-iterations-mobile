part of 'events_bloc.dart';

@immutable
sealed class EventsEvent {}

final class AddEvent extends EventsEvent {
  final String projectId;
  final String eventName;
  final String eventDetails;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventLocation;
  final String eventLink;

  AddEvent({
    required this.projectId,
    required this.eventName,
    required this.eventDetails,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventLocation,
    required this.eventLink,
  });
}

final class EventsView extends EventsEvent {
  final String projectId;

  EventsView({required this.projectId});
}

final class DeleteEvent extends EventsEvent {
  final String projectId;
  final String eventId;

  DeleteEvent({
    required this.eventId,
    required this.projectId,
  });
}
