import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

import '../entities/delete_task_response_entity.dart';

class DeleteTaskUseCase
    implements UseCase<DeleteTaskResponseEntity, DeleteTaskParam> {
  final TasksRepository tasksRepository;

  DeleteTaskUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, DeleteTaskResponseEntity>> call(
      DeleteTaskParam param) {
    return tasksRepository.deleteTasks(
      projectId: param.projectId,
      taskId: param.taskId,
    );
  }
}

class DeleteTaskParam {
  final String projectId;
  final String taskId;

  DeleteTaskParam(
    this.taskId,
    this.projectId,
  );
}
