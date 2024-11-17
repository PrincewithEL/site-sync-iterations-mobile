import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

import '../entities/create_task_response_entity.dart';

class AddTaskUseCase implements UseCase<CreateTaskResponseEntity, AddTaskParam> {
  final TasksRepository tasksRepository;

  AddTaskUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, CreateTaskResponseEntity>> call(AddTaskParam params) {
    return tasksRepository.createTasks(
      projectId: params.projectId,
      taskName: params.taskName,
      taskDetails: params.taskDetails,
      dueDate: params.dueDate,
      transactionPrice: params.transactionPrice,
      members: params.members,
      dependentTask: params.dependentTask,
    );
  }
}

class AddTaskParam {
  final String projectId;
  final String taskName;
  final String taskDetails;
  final String dueDate;
  final String transactionPrice;
  final List<num> members;
  final String dependentTask;

  AddTaskParam(
    this.taskName,
    this.projectId,
    this.taskDetails,
    this.dueDate,
    this.transactionPrice,
    this.members,
    this.dependentTask,
  );
}
