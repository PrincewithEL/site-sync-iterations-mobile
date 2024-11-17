part of 'create_project_bloc.dart';

@immutable
sealed class CreateProjectState {}

final class CreateProjectInitial extends CreateProjectState {}

final class CreateProjectLoading extends CreateProjectState {}

final class CreateProjectSuccess extends CreateProjectState {
  final String response;

  CreateProjectSuccess({required this.response});
}

final class CreateProjectFailure extends CreateProjectState {
  final String message;

  CreateProjectFailure({required this.message});
}

final class LeaveProjectLoading extends CreateProjectState {}

final class LeaveProjectSuccess extends CreateProjectState {
  final String response;

  LeaveProjectSuccess({required this.response});
}

final class LeaveProjectFailure extends CreateProjectState {
  final String message;

  LeaveProjectFailure({required this.message});
}

