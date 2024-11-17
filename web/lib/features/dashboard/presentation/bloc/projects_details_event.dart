part of 'projects_details_bloc.dart';

@immutable
sealed class ProjectsDetailsEvent {}

final class LoadProjectsDetails extends ProjectsDetailsEvent {
  LoadProjectsDetails();
}
