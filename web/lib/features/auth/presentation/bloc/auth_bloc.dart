import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/auth/domain/usecases/complete_profile.dart';
import 'package:site_sync/features/auth/domain/usecases/reset_password.dart';
import 'package:site_sync/features/auth/domain/usecases/user_sign_in.dart';
import 'package:site_sync/features/auth/domain/usecases/verify_otp_code.dart';

import '../../domain/usecases/user_sign_up.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final CompleteProfileUseCase _completeProfileUseCase;
  final SignInUseCase _signInUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final VerifyOtpCodeUseCase _verifyOTPUseCase;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required CompleteProfileUseCase completeProfileUseCase,
    required SignInUseCase signInUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required VerifyOtpCodeUseCase verifyOTPUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _completeProfileUseCase = completeProfileUseCase,
        _signInUseCase = signInUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _verifyOTPUseCase = verifyOTPUseCase,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthCompleteSignUp>(_onAuthCompleteSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthResetPassword>(_onAuthResetPassword);
    on<VerifyOTP>(_onVerifyOtp);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final signUpResponse = await _signUpUseCase(UserSignUpParams(
      fullName: event.fullName,
      emailAddress: event.emailAddress,
      phoneNumber: event.phoneNumber,
      password: event.password,
    ));
    signUpResponse.fold(
      (failure) => emit(
        AuthFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        AuthSuccess(
          response: response.message!,
        ),
      ),
    );
  }

  void _onAuthCompleteSignUp(
      AuthCompleteSignUp event, Emitter<AuthState> emit) async {
    emit(CompleteProfileLoading());
    final completeSignUpResponse = await _completeProfileUseCase(CompleteProfileParam(
      userType: event.userType,
      profilePicture: event.profilePicture,
    ));
    completeSignUpResponse.fold(
      (failure) => emit(
        CompleteProfileFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        CompleteProfileSuccess(
          response: response.message!,
        ),
      ),
    );
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final signInResponse = await _signInUseCase(UserSignInParams(
      emailAddress: event.emailAddress,
      password: event.password,
    ));
    signInResponse.fold(
      (failure) => emit(
        AuthFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        AuthSuccess(
          response: response.message!,
        ),
      ),
    );
  }

  void _onAuthResetPassword(
      AuthResetPassword event, Emitter<AuthState> emit) async {
    emit(ResetPasswordLoading());
    final signInResponse = await _resetPasswordUseCase(
      ResetPasswordParams(
        emailAddress: event.emailAddress,
      ),
    );
    signInResponse.fold(
      (failure) => emit(
        ResetPasswordFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        ResetPasswordSuccess(
          response: response.message!,
        ),
      ),
    );
  }

  void _onVerifyOtp(VerifyOTP event, Emitter<AuthState> emit) async {
    emit(VerifyOTPLoading());
    final signInResponse = await _verifyOTPUseCase(
      VerifyOtpCodeParams(
        otpCode: event.otpCode,
      ),
    );
    signInResponse.fold(
      (failure) => emit(
        VerifyOTPFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        VerifyOTPSuccess(
          response: response.message!,
        ),
      ),
    );
  }
}
