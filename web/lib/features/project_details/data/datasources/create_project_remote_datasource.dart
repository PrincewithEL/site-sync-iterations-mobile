import 'package:dio/dio.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/services/network/end_points.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/project_details/data/models/create_project_model.dart';
import 'package:site_sync/features/project_details/data/models/leave_project_model.dart';
import 'package:site_sync/features/project_details/data/models/leave_project_request_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';
import '../../../../core/utils/utils.dart';

abstract interface class CreateProjectRemoteDataSource {
  Future<String> createProject({
    required String startDate,
    required String endDate,
    required String estimatedBudget,
    required String projectDetails,
    required String projectImage,
    required String projectName,
  });

  Future<LeaveProjectResponseModel> leaveProject({
    required String projectId,
  });
}

class CreateProjectRemoteDataSourceImpl
    implements CreateProjectRemoteDataSource {
  final ApiService apiService;

  CreateProjectRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> createProject({
    required String startDate,
    required String endDate,
    required String estimatedBudget,
    required String projectDetails,
    required String projectImage,
    required String projectName,
  }) async {
    try {
      final createProject = CreateProjectModel(
        startDate: startDate,
        endDate: endDate,
        estimatedBudget: estimatedBudget,
        projectDetails: projectDetails,
        projectImage: projectImage,
        projectName: projectName,
      );
      final response = await apiService.postFormDataRequest(
        payload: await createProject.toFormData(),
        url: EndPoints.createProject.url,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<LeaveProjectResponseModel> leaveProject({required String projectId}) async {
    try {
      final currentUser = await SecureStorage().getCredentials(userIdKey);
      final url = replaceUrlParameters(EndPoints.leaveProject.url, {
        "projectId": projectId,
      });
      final response = await apiService.postRequest(
        payload: LeaveProjectRequestModel(
          uid: projectId,
          userId: currentUser,
        ).toJson(),
        url: url,
      );
      return LeaveProjectResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
