import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';
import 'package:site_sync/features/dashboard/domain/repository/project_details_repository.dart';

class ProjectsDetailsUseCase
    implements UseCase<ProjectsDetailsResponseEntity, void> {
  final ProjectDetailsRepository repository;

  const ProjectsDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProjectsDetailsResponseEntity>> call(
    void params,
  ) async {
    return await repository.getClientProjects();
  }
}
