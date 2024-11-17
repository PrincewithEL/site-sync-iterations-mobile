import 'package:fpdart/fpdart.dart';
import 'package:site_sync/features/events/data/datasource/event_remote_datasource.dart';
import 'package:site_sync/features/events/domain/entity/add_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/event_details_response_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repository/event_repository.dart';

class EventsRepositoryImpl implements EventsRepository {
  final EventsRemoteDataSource eventsRemoteDataSource;

  EventsRepositoryImpl(this.eventsRemoteDataSource);

  @override
  Future<Either<Failure, EventDetailsResponseEntity>> getAllEvents({
    required final String projectId,
  }) async {
    try {
      final response = await eventsRemoteDataSource.getAllEvents(
        projectId: projectId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, AddEventResponseEntity>> addEvent({
    required String projectId,
    required String eventName,
    required String eventDetails,
    required String eventDate,
    required String eventStartTime,
    required String eventEndTime,
    required String eventLocation,
    required String eventLink,
  }) async {
    try {
      final response = await eventsRemoteDataSource.addEvent(
        projectId: projectId,
        eventName: eventName,
        eventDetails: eventDetails,
        eventDate: eventDate,
        eventStartTime: eventStartTime,
        eventEndTime: eventEndTime,
        eventLocation: eventLocation,
        eventLink: eventLink,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, DeleteEventResponseEntity>> deleteEvent({
    required String projectId,
    required String eventId,
  }) async {
    try {
      final response = await eventsRemoteDataSource.deleteEvent(
        projectId: projectId,
        eventId: eventId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
