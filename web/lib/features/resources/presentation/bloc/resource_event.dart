part of 'resource_bloc.dart';

@immutable
sealed class ResourceEvent {}

class AddResourceEvent extends ResourceEvent {
  final String projectId;
  final String resourceFile;
  final String resourceDetails;
  final String resourceName;

  AddResourceEvent({
    required this.projectId,
    required this.resourceFile,
    required this.resourceDetails,
    required this.resourceName,
  });
}

class DeleteResourceEvent extends ResourceEvent {
  final String projectId;
  final String resourceId;

  DeleteResourceEvent({
    required this.projectId,
    required this.resourceId,
  });
}

class ViewResourceEvent extends ResourceEvent {
  final String projectId;

  ViewResourceEvent({
    required this.projectId,
  });
}
