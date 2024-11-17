import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/repository/resource_repository.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';

class ViewResourceUseCase implements UseCase<ResourceResponseEntity, String> {
  final ResourceRepository resourceRepository;

  ViewResourceUseCase(this.resourceRepository);

  @override
  Future<Either<Failure, ResourceResponseEntity>> call(
    final String projectId,
  ) {
    return resourceRepository.getAllResources(
      projectId: projectId,
    );
  }
}
