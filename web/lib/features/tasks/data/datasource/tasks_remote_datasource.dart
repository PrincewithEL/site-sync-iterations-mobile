import 'package:dio/dio.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/services/network/end_points.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/core/utils/utils.dart';
import 'package:site_sync/features/tasks/data/models/complete_task_response_model.dart';
import 'package:site_sync/features/tasks/data/models/create_task_request_model.dart';
import 'package:site_sync/features/tasks/data/models/create_task_response_model.dart';
import 'package:site_sync/features/tasks/data/models/delete_task_response_model.dart';
import 'package:site_sync/features/tasks/data/models/view_tasks_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';

abstract interface class TasksRemoteDataSource {
  Future<ViewTasksModel> viewTasks({
    required final String projectId,
  });

  Future<CreateTaskResponseModel> createTasks({
    required final String projectId,
    required final String taskName,
    required final String taskDetails,
    required final String dueDate,
    required final String transactionPrice,
    required final List<num> members,
    required final String dependentTask,
  });

  Future<DeleteTaskResponseModel> deleteTasks({
    required final String projectId,
    required final String taskId,
  });

  Future<CompleteTaskResponseModel> completeTasks({
    required final String projectId,
    required final String taskId,
  });
}

class TasksRemoteDataSourceImpl implements TasksRemoteDataSource {
  final ApiService apiService;

  TasksRemoteDataSourceImpl(this.apiService);

  @override
  Future<CompleteTaskResponseModel> completeTasks({
    required String projectId,
    required String taskId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.completeTask.url, {
        "projectId": projectId,
        "taskId": taskId,
      });
      final response = await apiService.patchRequest(
        payload: {},
        url: url,
      );
      return CompleteTaskResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<CreateTaskResponseModel> createTasks({
    required final String projectId,
    required final String taskName,
    required final String taskDetails,
    required final String dueDate,
    required final String transactionPrice,
    required final List<num> members,
    required final String dependentTask,
  }) async {
    try {
      final url = replaceUrlParameters(
        EndPoints.createTask.url,
        {"projectId": projectId},
      );
      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final payload = CreateTaskRequestModel(
        dependentTask: dependentTask.isEmpty ? null : dependentTask,
        dueDate: dueDate,
        members: members,
        userId: currentUserId,
        taskDetails: taskDetails,
        taskName: taskName,
        transactionPrice: int.parse(transactionPrice),
      );
      final response = await apiService.postRequest(
        payload: payload.toJson(),
        url: url,
        allowAuthOption: true,
      );
      return CreateTaskResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      throw ServerException(
          error: SiteSyncError.fromJson(error.response?.data));
    }
  }

  @override
  Future<DeleteTaskResponseModel> deleteTasks({
    required String projectId,
    required String taskId,
  }) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.deleteTask.url,
        {
          "projectId": projectId,
          "taskId": taskId,
        },
      );
      final response = await apiService.deleteRequest(
        payload: {},
        url: url,
        allowAuthOption: true,
      );
      return DeleteTaskResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<ViewTasksModel> viewTasks({
    required String projectId,
  }) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.viewTasks.url,
        {"projectId": projectId},
      );
      final response = await apiService.getRequest(
        url: url,
        allowAuthOption: true,
      );
      return ViewTasksModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
