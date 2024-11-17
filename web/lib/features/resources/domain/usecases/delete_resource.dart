import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/repository/resource_repository.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

class DeleteResourceUseCase
    implements UseCase<DeleteResponseResponseEntity, DeleteResourceParam> {
  final ResourceRepository resourceRepository;

  DeleteResourceUseCase(this.resourceRepository);

  @override
  Future<Either<Failure, DeleteResponseResponseEntity>> call(
    DeleteResourceParam params,
  ) {
    return resourceRepository.deleteResources(
      projectId: params.projectId,
      resourceId: params.resourceId,
    );
  }
}

class DeleteResourceParam {
  final String projectId;
  final String resourceId;

  DeleteResourceParam({
    required this.projectId,
    required this.resourceId,
  });
}
