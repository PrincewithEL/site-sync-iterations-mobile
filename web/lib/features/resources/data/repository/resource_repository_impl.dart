import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/repository/resource_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../datasource/resource_remote_datasource.dart';

class ResourceRepositoryImpl implements ResourceRepository {
  final ResourceRemoteDataSource resourceRemoteDataSource;

  ResourceRepositoryImpl(this.resourceRemoteDataSource);

  @override
  Future<Either<Failure, AddResourceResponseEntity>> addResources({
    required String projectId,
    required String resourceFile,
    required String resourceDetails,
    required String resourceName,
  }) async {
    try {
      final response = await resourceRemoteDataSource.addResources(
        projectId: projectId,
        resourceDetails: resourceDetails,
        resourceFile: resourceFile,
        resourceName: resourceName,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, DeleteResponseResponseEntity>> deleteResources({
    required String projectId,
    required String resourceId,
  }) async {
    try {
      final response = await resourceRemoteDataSource.deleteResources(
        projectId: projectId,
        resourceId: resourceId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, ResourceResponseEntity>> getAllResources({
    required String projectId,
  }) async {
    try {
      final response = await resourceRemoteDataSource.getAllResources(
        projectId: projectId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
