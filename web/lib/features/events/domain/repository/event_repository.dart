import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/events/domain/entity/add_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/event_details_response_entity.dart';

abstract interface class EventsRepository {
  Future<Either<Failure, EventDetailsResponseEntity>> getAllEvents({
    required final String projectId,
  });

  Future<Either<Failure, AddEventResponseEntity>> addEvent({
    required final String projectId,
    required final String eventName,
    required final String eventDetails,
    required final String eventDate,
    required final String eventStartTime,
    required final String eventEndTime,
    required final String eventLocation,
    required final String eventLink,
  });

  Future<Either<Failure, DeleteEventResponseEntity>> deleteEvent({
    required final String projectId,
    required String eventId,
  });

}
