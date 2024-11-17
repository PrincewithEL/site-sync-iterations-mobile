part of 'events_bloc.dart';

@immutable
sealed class EventsState {}

final class EventsInitial extends EventsState {}

final class AddEventLoading extends EventsState {}

final class AddEventSuccess extends EventsState {
  final String response;

  AddEventSuccess({
    required this.response,
  });
}

final class AddEventFailure extends EventsState {
  final String message;

  AddEventFailure({required this.message});
}

final class EventsViewLoading extends EventsState {}

final class EventsViewSuccess extends EventsState {
  final bool isVisible;
  final EventDetailsResponseEntity response;

  EventsViewSuccess({
    required this.isVisible,
    required this.response,
  });
}

final class EventsViewFailure extends EventsState {
  final String message;

  EventsViewFailure({required this.message});
}

final class DeleteEventLoading extends EventsState {}

final class DeleteEventSuccess extends EventsState {
  final String response;

  DeleteEventSuccess({
    required this.response,
  });
}

final class DeleteEventFailure extends EventsState {
  final String message;

  DeleteEventFailure({required this.message});
}
