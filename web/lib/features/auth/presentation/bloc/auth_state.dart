part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String response;

  AuthSuccess({required this.response});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}

/// State changes for Complete Profile
final class CompleteProfileLoading extends AuthState {}

final class CompleteProfileSuccess extends AuthState {
  final String response;

  CompleteProfileSuccess({required this.response});
}

final class CompleteProfileFailure extends AuthState {
  final String message;

  CompleteProfileFailure({required this.message});
}

/// State changes for Reset Password
final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {
  final String response;

  ResetPasswordSuccess({required this.response});
}

final class ResetPasswordFailure extends AuthState {
  final String message;

  ResetPasswordFailure({required this.message});
}

/// State changes for Verify OTP
final class VerifyOTPLoading extends AuthState {}

final class VerifyOTPSuccess extends AuthState {
  final String response;

  VerifyOTPSuccess({required this.response});
}

final class VerifyOTPFailure extends AuthState {
  final String message;

  VerifyOTPFailure({required this.message});
}
