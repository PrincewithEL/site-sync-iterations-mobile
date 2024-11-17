part of 'create_project_bloc.dart';

@immutable
sealed class CreateProjectEvent {}

final class CreateProject extends CreateProjectEvent {
  final String startDate;
  final String endDate;
  final String estimatedBudget;
  final String projectDetails;
  final String projectImage;
  final String projectName;

  CreateProject(
    this.startDate,
    this.endDate,
    this.estimatedBudget,
    this.projectDetails,
    this.projectImage,
    this.projectName,
  );
}

final class LeaveProject extends CreateProjectEvent {
  final String projectId;

  LeaveProject(this.projectId);
}
