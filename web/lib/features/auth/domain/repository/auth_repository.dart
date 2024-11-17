import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/auth/domain/entities/complete_profile/complete_profile_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/reset_password/reset_pwd_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/signin/signin_response_entity.dart';
import 'package:site_sync/features/auth/domain/entities/verify_otp/verify_otp_response_entity.dart';

import '../entities/signup/signup_response_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, SignupResponseEntity>> signUpWithEmailPassword({
    required String fullName,
    required String phoneNumber,
    required String emailAddress,
    required String password,
  });

  Future<Either<Failure, CompleteProfileResponseEntity>> completeSignUpWithEmailPassword({
    required String userType,
    required String profilePicture,
  });

  Future<Either<Failure, SignInResponseEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, ResetPwdResponseEntity>> resetPasswordWithEmail({
    required String email,
  });

  Future<Either<Failure, VerifyOtpResponseEntity>> verifyEmailWithOTP({
    required String otpCode,
  });

}
