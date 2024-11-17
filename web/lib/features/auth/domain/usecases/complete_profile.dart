import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/auth/domain/entities/complete_profile/complete_profile_response_entity.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

class CompleteProfileUseCase implements UseCase<CompleteProfileResponseEntity, CompleteProfileParam> {
  final AuthRepository authRepository;

  const CompleteProfileUseCase(this.authRepository);

  @override
  Future<Either<Failure, CompleteProfileResponseEntity>> call(CompleteProfileParam params) async {
    return await authRepository.completeSignUpWithEmailPassword(
      userType: params.userType,
      profilePicture: params.profilePicture
    );
  }
}

class CompleteProfileParam {
  final String userType;
  final String profilePicture;

  CompleteProfileParam({
    required this.userType,
    required this.profilePicture,
  });
}
