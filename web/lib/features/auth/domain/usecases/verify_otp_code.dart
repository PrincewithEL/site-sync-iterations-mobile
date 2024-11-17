import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/auth/domain/entities/verify_otp/verify_otp_response_entity.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

class VerifyOtpCodeUseCase implements UseCase<VerifyOtpResponseEntity, VerifyOtpCodeParams> {
  final AuthRepository authRepository;

  const VerifyOtpCodeUseCase(this.authRepository);

  @override
  Future<Either<Failure, VerifyOtpResponseEntity>> call(VerifyOtpCodeParams params) async {
    return await authRepository.verifyEmailWithOTP(
      otpCode: params.otpCode,
    );
  }
}

class VerifyOtpCodeParams {
  final String otpCode;

  VerifyOtpCodeParams({
    required this.otpCode,
  });
}
