import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/events/domain/entity/add_event_response_entity.dart';
import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';
import 'package:site_sync/features/events/domain/repository/event_repository.dart';

class AddEventsUseCase
    implements UseCase<AddEventResponseEntity, AddEventsParams> {
  final EventsRepository repository;

  AddEventsUseCase(this.repository);

  @override
  Future<Either<Failure, AddEventResponseEntity>> call(
    AddEventsParams params,
  ) async {
    return await repository.addEvent(
      projectId: params.projectId,
      eventName: params.eventName,
      eventDetails: params.eventDetails,
      eventDate: params.eventDate,
      eventStartTime: params.eventStartTime,
      eventEndTime: params.eventEndTime,
      eventLocation: params.eventLocation,
      eventLink: params.eventLink,
    );
  }
}

class AddEventsParams {
  final String projectId;
  final String eventName;
  final String eventDetails;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventLocation;
  final String eventLink;

  AddEventsParams({
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
