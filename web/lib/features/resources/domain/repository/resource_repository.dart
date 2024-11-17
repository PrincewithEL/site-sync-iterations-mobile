import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';

abstract interface class ResourceRepository {
  Future<Either<Failure, ResourceResponseEntity>> getAllResources({
    required final String projectId,
  });

  Future<Either<Failure, AddResourceResponseEntity>> addResources({
    required final String projectId,
    required String resourceFile,
    required String resourceDetails,
    required String resourceName,
  });

  Future<Either<Failure, DeleteResponseResponseEntity>> deleteResources({
    required final String projectId,
    required final String resourceId,
  });
}