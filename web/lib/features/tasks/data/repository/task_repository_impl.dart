import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/tasks/data/datasource/tasks_remote_datasource.dart';
import 'package:site_sync/features/tasks/domain/entities/complete_task_response_entity.dart';
import 'package:site_sync/features/tasks/domain/entities/create_task_response_entity.dart';
import 'package:site_sync/features/tasks/domain/entities/delete_task_response_entity.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

import '../models/view_tasks_model.dart';

class TaskRepositoryImpl implements TasksRepository {
  final TasksRemoteDataSource tasksRemoteDataSource;

  TaskRepositoryImpl(this.tasksRemoteDataSource);

  @override
  Future<Either<Failure, CompleteTaskResponseEntity>> completeTasks({
    required String projectId,
    required String taskId,
  }) async {
    try {
      final response = await tasksRemoteDataSource.completeTasks(
        projectId: projectId,
        taskId: taskId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, CreateTaskResponseEntity>> createTasks({
    required final String projectId,
    required final String taskName,
    required final String taskDetails,
    required final String dueDate,
    required final String transactionPrice,
    required final List<num> members,
    required final String dependentTask,
  }) async {
    try {
      final response = await tasksRemoteDataSource.createTasks(
        projectId: projectId,
        taskName: taskName,
        taskDetails: taskDetails,
        dueDate: dueDate,
        transactionPrice: transactionPrice,
        members: members,
        dependentTask: dependentTask,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, DeleteTaskResponseEntity>> deleteTasks({
    required String projectId,
    required String taskId,
  }) async {
    try {
      final response = await tasksRemoteDataSource.deleteTasks(
        projectId: projectId,
        taskId: taskId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, ViewTasksModel>> viewTasks({
    required String projectId,
  }) async {
    try {
      final response = await tasksRemoteDataSource.viewTasks(
        projectId: projectId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
