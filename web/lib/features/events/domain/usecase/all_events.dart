import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/events/domain/entity/event_details_response_entity.dart';
import 'package:site_sync/features/events/domain/repository/event_repository.dart';
import 'package:site_sync/features/project_details/domain/repository/create_project_repository.dart';

class ViewEventsUseCase implements UseCase<EventDetailsResponseEntity, String> {
  final EventsRepository repository;

  ViewEventsUseCase(this.repository);

  @override
  Future<Either<Failure, EventDetailsResponseEntity>> call(String projectId) async {
    return await repository.getAllEvents(projectId: projectId);
  }
}
