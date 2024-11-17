import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:site_sync/features/auth/data/models/complete_profile/complete_profile_response_model.dart';
import 'package:site_sync/features/auth/data/models/reset_password/reset_pwd_response_model.dart';
import 'package:site_sync/features/auth/data/models/signin/signin_response_model.dart';
import 'package:site_sync/features/auth/data/models/signup/signup_response_model.dart';
import 'package:site_sync/features/auth/data/models/verify_otp/verify_otp_response_model.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/utils/constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, SignInResponseModel>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      await SecureStorage().clearCredentials();
      await SecureStorage().setCredentials(
          userId: response.data!.userId.toString(),
          userType: response.data!.userType!,
          username: email,
          password: password);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> signUpWithEmailPassword({
    required String fullName,
    required String phoneNumber,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signUpWithEmailPassword(
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        fullName: fullName,
        password: password,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponseModel>> resetPasswordWithEmail({
    required String email,
  }) async {
    try {
      final response = await authRemoteDataSource.resetPasswordWithEmail(
        email: email,
      );
      SecureStorage().clearCredentials();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> verifyEmailWithOTP({
    required String otpCode,
  }) async {
    try {
      final response = await authRemoteDataSource.verifyEmailWithOTP(
        otpCode: otpCode,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, CompleteProfileResponseModel>>
      completeSignUpWithEmailPassword({
    required String userType,
    required String profilePicture,
  }) async {
    try {
      final response =
          await authRemoteDataSource.completeSignUpWithEmailPassword(
        userType: userType,
        profilePicture: profilePicture,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
