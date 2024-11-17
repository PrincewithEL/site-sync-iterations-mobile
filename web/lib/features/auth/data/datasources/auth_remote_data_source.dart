import 'package:dio/dio.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/site_sync_error.dart';
import 'package:site_sync/features/auth/data/models/complete_profile/complete_profile_request_model.dart';
import 'package:site_sync/features/auth/data/models/complete_profile/complete_profile_response_model.dart';
import 'package:site_sync/features/auth/data/models/reset_password/reset_pwd_request_model.dart';
import 'package:site_sync/features/auth/data/models/reset_password/reset_pwd_response_model.dart';
import 'package:site_sync/features/auth/data/models/signin/signin_request_model.dart';
import 'package:site_sync/features/auth/data/models/signup/signup_request_model.dart';
import 'package:site_sync/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:site_sync/features/auth/data/models/verify_otp/verify_otp_response_model.dart';

import '../../../../core/services/network/api_service.dart';
import '../../../../core/services/network/end_points.dart';
import '../models/signin/signin_response_model.dart';
import '../models/signup/signup_response_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<SignupResponseModel> signUpWithEmailPassword({
    required String fullName,
    required String phoneNumber,
    required String emailAddress,
    required String password,
  });

  Future<CompleteProfileResponseModel> completeSignUpWithEmailPassword({
    required String userType,
    required String profilePicture,
  });

  Future<SignInResponseModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<ResetPasswordResponseModel> resetPasswordWithEmail({
    required String email,
  });

  Future<VerifyOtpResponseModel> verifyEmailWithOTP({
    required String otpCode,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignInResponseModel> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.postRequest(
        payload: SignInRequestModel(
          identifier: email,
          password: password,
        ).toJson(),
        url: EndPoints.signIn.url,
      );
      return SignInResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<SignupResponseModel> signUpWithEmailPassword({
    required String fullName,
    required String phoneNumber,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final response = await apiService.postRequest(
        payload: SignUpRequestModel(
          fullname: fullName,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password,
        ).toJson(),
        url: EndPoints.signUp.url,
      );
      return SignupResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<ResetPasswordResponseModel> resetPasswordWithEmail({
    required String email,
  }) async {
    try {
      final response = await apiService.postRequest(
        payload: ResetPasswordRequestModel(email: email).toJson(),
        url: EndPoints.resetPassword.url,
      );
      return ResetPasswordResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<VerifyOtpResponseModel> verifyEmailWithOTP({
    required String otpCode,
  }) async {
    try {
      final response = await apiService.postRequest(
        payload: VerifyOtpRequestModel(otpCode: otpCode).toJson(),
        url: EndPoints.verifyOtp.url,
      );
      return VerifyOtpResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<CompleteProfileResponseModel> completeSignUpWithEmailPassword({
    required String userType,
    required String profilePicture,
  }) async {
    try {
      final response = await apiService.postRequest(
        payload: CompleteProfileRequestModel(userType: userType, profilePicture: profilePicture).toJson(),
        url: EndPoints.completeProfile.url,
      );
      return CompleteProfileResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
