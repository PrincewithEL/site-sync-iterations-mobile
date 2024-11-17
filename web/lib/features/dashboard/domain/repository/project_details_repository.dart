import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';

abstract interface class ProjectDetailsRepository {
  Future<Either<Failure, ProjectsDetailsResponseEntity>> getClientProjects();
  Future<Either<Failure, String>> getProjectDetails();
}