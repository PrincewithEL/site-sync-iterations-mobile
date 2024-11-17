import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/auth/domain/entities/reset_password/reset_pwd_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/signin/signin_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/signup/signup_response_entity.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<ResetPwdResponseEntity, ResetPasswordParams> {
  final AuthRepository authRepository;

  const ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, ResetPwdResponseEntity>> call(ResetPasswordParams params) async {
    return await authRepository.resetPasswordWithEmail(
      email: params.emailAddress,
    );
  }
}

class ResetPasswordParams {
  final String emailAddress;

  ResetPasswordParams({
    required this.emailAddress,
  });
}
