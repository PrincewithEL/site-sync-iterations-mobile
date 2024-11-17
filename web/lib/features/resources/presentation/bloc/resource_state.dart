part of 'resource_bloc.dart';

@immutable
sealed class ResourceState {}

final class ResourceInitial extends ResourceState {}

final class AddResourceLoading extends ResourceState {}

final class AddResourceSuccess extends ResourceState {
  final AddResourceResponseEntity response;

  AddResourceSuccess({
    required this.response,
  });
}

final class AddResourceFailure extends ResourceState {
  final String message;

  AddResourceFailure({
    required this.message,
  });
}

final class DeleteResourceLoading extends ResourceState {}

final class DeleteResourceSuccess extends ResourceState {
  final DeleteResponseResponseEntity response;

  DeleteResourceSuccess({
    required this.response,
  });
}

final class DeleteResourceFailure extends ResourceState {
  final String message;

  DeleteResourceFailure({
    required this.message,
  });
}

final class ViewResourceLoading extends ResourceState {}

final class ViewResourceSuccess extends ResourceState {
  final ResourceResponseEntity response;

  ViewResourceSuccess({
    required this.response,
  });
}

final class ViewResourceFailure extends ResourceState {
  final String message;

  ViewResourceFailure({
    required this.message,
  });
}
