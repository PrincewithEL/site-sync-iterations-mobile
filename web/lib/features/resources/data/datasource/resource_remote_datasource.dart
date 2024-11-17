import 'package:dio/dio.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/resources/data/models/add_resource_model.dart';
import 'package:site_sync/features/resources/data/models/add_resource_response_model.dart';
import 'package:site_sync/features/resources/data/models/delete_resource_response_model.dart';
import 'package:site_sync/features/resources/data/models/resource_response_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';
import '../../../../core/services/network/end_points.dart';
import '../../../../core/utils/utils.dart';

abstract interface class ResourceRemoteDataSource {
  Future<ResourceResponseModel> getAllResources({
    required final String projectId,
  });

  Future<AddResourceResponseModel> addResources({
    required final String projectId,
    required String resourceFile,
    required String resourceDetails,
    required String resourceName,
  });

  Future<DeleteResourceResponseModel> deleteResources({
    required final String projectId,
    required final String resourceId,
  });
}

class ResourceRemoteDataSourceImpl implements ResourceRemoteDataSource {
  final ApiService apiService;

  ResourceRemoteDataSourceImpl(this.apiService);

  @override
  Future<ResourceResponseModel> getAllResources({
    required String projectId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.getAllResources.url, {
        "projectId": projectId,
      });
      final response = await apiService.getRequest(
        url: url,
        allowAuthOption: true,
      );
      return ResourceResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<AddResourceResponseModel> addResources({
    required String projectId,
    required String resourceFile,
    required String resourceDetails,
    required String resourceName,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.addResource.url, {
        "projectId": projectId,
      });

      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final addResourceModel = await AddResourceModel(
        resourceFile: resourceFile,
        resourceDetails: resourceDetails,
        resourceName: resourceName,
        userId: currentUserId,
      ).toFormData();

      final response = await apiService.postFormDataRequest(
        payload: addResourceModel,
        url: url,
        allowAuthOption: true,
      );
      return AddResourceResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<DeleteResourceResponseModel> deleteResources({
    required String projectId,
    required String resourceId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.deleteResource.url, {
        "projectId": projectId,
        "resourceId": resourceId,
      });
      final response = await apiService.deleteRequest(
        payload: {},
        url: url,
        allowAuthOption: true,
      );
      return DeleteResourceResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
