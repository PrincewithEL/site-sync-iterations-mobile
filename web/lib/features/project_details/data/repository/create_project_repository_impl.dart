import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/project_details/data/datasources/create_project_remote_datasource.dart';
import 'package:site_sync/features/project_details/domain/entities/leave_project_entity.dart';
import 'package:site_sync/features/project_details/domain/repository/create_project_repository.dart';

class CreateProjectRepositoryImpl implements CreateProjectRepository {
  final CreateProjectRemoteDataSource remoteDataSource;

  CreateProjectRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> createProject({
    required String startDate,
    required String endDate,
    required String estimatedBudget,
    required String projectDetails,
    required String projectImage,
    required String projectName,
  }) async {
    try {
      final response = await remoteDataSource.createProject(
        startDate: startDate,
        endDate: endDate,
        estimatedBudget: estimatedBudget,
        projectDetails: projectDetails,
        projectImage: projectImage,
        projectName: projectName,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, LeaveProjectResponseEntity>> leaveProject({
    required String projectId,
  }) async {
    try {
      final response = await remoteDataSource.leaveProject(
        projectId: projectId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
