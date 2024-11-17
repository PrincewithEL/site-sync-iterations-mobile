import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/tasks/domain/entities/view_tasks_entity.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

class ViewTasksUseCase implements UseCase<ViewTasksEntity, String> {
  final TasksRepository tasksRepository;

  ViewTasksUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, ViewTasksEntity>> call(String projectId) {
    return tasksRepository.viewTasks(
      projectId: projectId
    );
  }
}

