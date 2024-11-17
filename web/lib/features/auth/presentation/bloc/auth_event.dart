part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String password;

  AuthSignUp({
    required this.fullName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.password,
  });
}

final class AuthCompleteSignUp extends AuthEvent {
  final String userType;
  final String profilePicture;

  AuthCompleteSignUp({
    required this.userType,
    required this.profilePicture,
  });
}

final class AuthSignIn extends AuthEvent {
  final String emailAddress;
  final String password;

  AuthSignIn({
    required this.emailAddress,
    required this.password,
  });
}

final class AuthResetPassword extends AuthEvent {
  final String emailAddress;

  AuthResetPassword({
    required this.emailAddress,
  });
}

final class VerifyOTP extends AuthEvent {
  final String otpCode;

  VerifyOTP({
    required this.otpCode,
  });
}


