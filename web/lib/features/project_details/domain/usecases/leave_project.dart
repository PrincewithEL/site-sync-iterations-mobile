import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/project_details/domain/repository/create_project_repository.dart';

import '../entities/leave_project_entity.dart';

class LeaveProjectUseCase
    implements UseCase<LeaveProjectResponseEntity, LeaveProjectParam> {
  final CreateProjectRepository repository;

  LeaveProjectUseCase(this.repository);

  @override
  Future<Either<Failure, LeaveProjectResponseEntity>> call(
      LeaveProjectParam params) async {
    return await repository.leaveProject(
      projectId: params.projectId,
    );
  }
}

class LeaveProjectParam {
  final String projectId;

  LeaveProjectParam(
    this.projectId,
  );
}
