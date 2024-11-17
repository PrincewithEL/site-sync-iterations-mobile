import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/project_details/domain/repository/create_project_repository.dart';

class CreateProjectUseCase implements UseCase<String, CreateProjectParam> {
  final CreateProjectRepository repository;

  CreateProjectUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CreateProjectParam params) async {
    return await repository.createProject(
      startDate: params.startDate,
      endDate: params.endDate,
      estimatedBudget: params.estimatedBudget,
      projectDetails: params.projectDetails,
      projectImage: params.projectImage,
      projectName: params.projectName,
    );
  }
}

class CreateProjectParam {
  final String startDate;
  final String endDate;
  final String estimatedBudget;
  final String projectDetails;
  final String projectImage;
  final String projectName;

  CreateProjectParam(
    this.startDate,
    this.endDate,
    this.estimatedBudget,
    this.projectDetails,
    this.projectImage,
    this.projectName,
  );
}
