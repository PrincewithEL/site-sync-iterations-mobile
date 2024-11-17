import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';

import '../entities/leave_project_entity.dart';

abstract interface class CreateProjectRepository {
  Future<Either<Failure, String>> createProject({
    required String startDate,
    required String endDate,
    required String estimatedBudget,
    required String projectDetails,
    required String projectImage,
    required String projectName,
  });

  Future<Either<Failure, LeaveProjectResponseEntity>> leaveProject({
    required String projectId,
  });
}
