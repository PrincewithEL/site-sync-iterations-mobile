part of 'projects_details_bloc.dart';

@immutable
sealed class ProjectsDetailsState {}

final class ProjectsDetailsInitial extends ProjectsDetailsState {}

final class ProjectsDetailsLoading extends ProjectsDetailsState {}

final class ProjectsDetailsSuccess extends ProjectsDetailsState {
  final ProjectsDetailsResponseEntity response;

  ProjectsDetailsSuccess({required this.response});
}

final class ProjectsDetailsFailure extends ProjectsDetailsState {
  final String message;

  ProjectsDetailsFailure({required this.message});
}
