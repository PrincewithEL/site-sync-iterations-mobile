import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

import '../entities/complete_task_response_entity.dart';

class CompleteTaskUseCase implements UseCase<CompleteTaskResponseEntity, CompleteTaskParam> {
  final TasksRepository tasksRepository;

  CompleteTaskUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, CompleteTaskResponseEntity>> call(CompleteTaskParam params) {
    return tasksRepository.completeTasks(
      projectId: params.projectId,
      taskId: params.taskId,
    );
  }
}

class CompleteTaskParam {
  final String projectId;
  final String taskId;

  CompleteTaskParam(
    this.taskId,
    this.projectId,
  );
}
