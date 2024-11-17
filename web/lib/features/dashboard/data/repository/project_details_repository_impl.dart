import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/dashboard/data/models/project_details_model.dart';
import 'package:site_sync/features/dashboard/domain/repository/project_details_repository.dart';

import '../datasource/project_details_remote_source.dart';

class ProjectDetailsRepositoryImpl implements ProjectDetailsRepository {
  final ProjectDetailsRemoteSource projectDetailsRemoteSource;

  const ProjectDetailsRepositoryImpl(this.projectDetailsRemoteSource);

  @override
  Future<Either<Failure, ProjectsDetailsResponseModel>>
      getClientProjects() async {
    try {
      final response = await projectDetailsRemoteSource.getClientProjects();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, String>> getProjectDetails() {
    // TODO: implement getProjectDetails
    throw UnimplementedError();
  }
}
