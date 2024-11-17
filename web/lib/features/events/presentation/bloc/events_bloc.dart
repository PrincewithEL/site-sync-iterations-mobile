import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/events/domain/entity/add_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/event_details_response_entity.dart';
import 'package:site_sync/features/events/domain/usecase/add_events.dart';
import 'package:site_sync/features/events/domain/usecase/all_events.dart';
import 'package:site_sync/features/events/domain/usecase/delete_events.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final ViewEventsUseCase _eventsUseCase;
  final AddEventsUseCase _addEventsUseCase;
  final DeleteEventsUseCase _deleteEventsUseCase;

  EventsBloc(AddEventsUseCase addEventsUseCase, ViewEventsUseCase eventsUseCase,
      DeleteEventsUseCase deleteEventsUseCase)
      : _addEventsUseCase = addEventsUseCase,
        _eventsUseCase = eventsUseCase,
        _deleteEventsUseCase = deleteEventsUseCase,
        super(EventsInitial()) {
    on<AddEvent>(_onAddEvents);
    on<EventsView>(_onViewEvents);
    on<DeleteEvent>(_onDeleteEvents);
  }

  void _onAddEvents(AddEvent event, Emitter<EventsState> emit) async {
    emit(AddEventLoading());
    final result = await _addEventsUseCase(
      AddEventsParams(
        projectId: event.projectId,
        eventName: event.eventName,
        eventDetails: event.eventDetails,
        eventDate: event.eventDate,
        eventStartTime: event.eventStartTime,
        eventEndTime: event.eventEndTime,
        eventLocation: event.eventLocation,
        eventLink: event.eventLink,
      ),
    );
    result.fold(
      (failure) => emit(
        AddEventFailure(
          message: failure.siteSyncError.message ?? "Failed",
        ),
      ),
      (events) => emit(
        AddEventSuccess(
          response: events.message ?? "Success",
        ),
      ),
    );
  }

  void _onViewEvents(EventsView event, Emitter<EventsState> emit) async {
    emit(EventsViewLoading());
    final result = await _eventsUseCase(event.projectId);
    final currentUser = await SecureStorage().getCredentials(userTypeId);
    result.fold(
      (failure) => emit(
        EventsViewFailure(
          message: failure.siteSyncError.message ?? "Failed",
        ),
      ),
      (events) => emit(
        EventsViewSuccess(
          response: events,
          isVisible: currentUser == "Client" ? true : false,
        ),
      ),
    );
  }

  void _onDeleteEvents(DeleteEvent event, Emitter<EventsState> emit) async {
    emit(DeleteEventLoading());
    final result = await _deleteEventsUseCase(
      DeleteEventsParams(
        projectId: event.projectId,
        eventId: event.eventId,
      ),
    );
    result.fold(
      (failure) => emit(
        DeleteEventFailure(
          message: failure.siteSyncError.message ?? "Failed",
        ),
      ),
      (events) => emit(
        DeleteEventSuccess(
          response: events.message ?? "Success",
        ),
      ),
    );
  }
}
