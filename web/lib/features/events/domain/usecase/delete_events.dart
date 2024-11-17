import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/events/domain/entity/delete_event_response_entity.dart';
import 'package:site_sync/features/events/domain/repository/event_repository.dart';

class DeleteEventsUseCase
    implements UseCase<DeleteEventResponseEntity, DeleteEventsParams> {
  final EventsRepository repository;

  DeleteEventsUseCase(this.repository);

  @override
  Future<Either<Failure, DeleteEventResponseEntity>> call(
    DeleteEventsParams params,
  ) async {
    return await repository.deleteEvent(
      projectId: params.projectId,
      eventId: params.eventId,
    );
  }
}

class DeleteEventsParams {
  final String projectId;
  final String eventId;

  DeleteEventsParams({
    required this.projectId,
    required this.eventId,
  });
}
