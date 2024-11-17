import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/auth/domain/entities/signup/signup_response_entity.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase implements UseCase<SignupResponseEntity, UserSignUpParams> {
  final AuthRepository authRepository;

  const SignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, SignupResponseEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      fullName: params.fullName,
      phoneNumber: params.phoneNumber,
      emailAddress: params.emailAddress,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String password;

  UserSignUpParams({
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.password,
  });
}
