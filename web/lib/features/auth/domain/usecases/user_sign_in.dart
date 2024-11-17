import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/auth/domain/entities/signin/signin_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/signup/signup_response_entity.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase implements UseCase<SignInResponseEntity, UserSignInParams> {
  final AuthRepository authRepository;

  const SignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, SignInResponseEntity>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailPassword(
      email: params.emailAddress,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String emailAddress;
  final String password;

  UserSignInParams({
    required this.emailAddress,
    required this.password,
  });
}
