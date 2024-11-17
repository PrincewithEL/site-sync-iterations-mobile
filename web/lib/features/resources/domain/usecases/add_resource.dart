import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/repository/resource_repository.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

class AddResourceUseCase
    implements UseCase<AddResourceResponseEntity, AddResourceParam> {
  final ResourceRepository resourceRepository;

  AddResourceUseCase(this.resourceRepository);

  @override
  Future<Either<Failure, AddResourceResponseEntity>> call(
    AddResourceParam params,
  ) {
    return resourceRepository.addResources(
      projectId: params.projectId,
      resourceFile: params.resourceFile,
      resourceDetails: params.resourceDetails,
      resourceName: params.resourceName,
    );
  }
}

class AddResourceParam {
  final String projectId;
  final String resourceFile;
  final String resourceDetails;
  final String resourceName;

  AddResourceParam({
    required this.projectId,
    required this.resourceFile,
    required this.resourceDetails,
    required this.resourceName,
  });
}
