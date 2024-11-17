import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/services/network/end_points.dart';
import 'package:site_sync/features/dashboard/data/models/project_details_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';

abstract interface class ProjectDetailsRemoteSource {
  Future<ProjectsDetailsResponseModel> getClientProjects();

  Future<String> getProjectDetails({required final String projectID});
}

class ProjectDetailsRemoteSourceImpl implements ProjectDetailsRemoteSource {
  final ApiService apiService;

  ProjectDetailsRemoteSourceImpl(this.apiService);

  @override
  Future<ProjectsDetailsResponseModel> getClientProjects() async {
    try {
      final response = await apiService.getRequest(
        url: EndPoints.clientProjects.url,
        allowAuthOption: true,
      );
      return ProjectsDetailsResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<String> getProjectDetails({
    required String projectID,
  }) async {
    try {
      final response = await apiService.getRequest(
        url: "${EndPoints.clientProjectDetails.url}$projectID",
        allowAuthOption: true,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
