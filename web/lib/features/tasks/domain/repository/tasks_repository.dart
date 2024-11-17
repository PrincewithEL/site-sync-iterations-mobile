import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/tasks/domain/entities/delete_task_response_entity.dart';
import 'package:site_sync/features/tasks/domain/entities/view_tasks_entity.dart';

import '../entities/complete_task_response_entity.dart';
import '../entities/create_task_response_entity.dart';

abstract interface class TasksRepository {
  Future<Either<Failure, ViewTasksEntity>> viewTasks({
    required final String projectId,
  });

  Future<Either<Failure, CreateTaskResponseEntity>> createTasks({
    required final String projectId,
    required final String taskName,
    required final String taskDetails,
    required final String dueDate,
    required final String transactionPrice,
    required final List<num> members,
    required final String dependentTask,
  });

  Future<Either<Failure, DeleteTaskResponseEntity>> deleteTasks({
    required final String projectId,
    required final String taskId,
  });

  Future<Either<Failure, CompleteTaskResponseEntity>> completeTasks({
    required final String projectId,
    required final String taskId,
  });
}
