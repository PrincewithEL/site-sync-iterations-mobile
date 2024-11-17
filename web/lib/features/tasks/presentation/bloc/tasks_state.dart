part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

// View Task
final class ViewTaskLoading extends TasksState {}

final class ViewTaskSuccess extends TasksState {
  final String userType;
  final ViewTasksEntity response;

  ViewTaskSuccess({
    required this.userType,
    required this.response,
  });
}

final class ViewTaskFailure extends TasksState {
  final String message;

  ViewTaskFailure({required this.message});
}

// Add Task
final class AddTaskLoading extends TasksState {}

final class AddTaskSuccess extends TasksState {
  final String response;

  AddTaskSuccess({required this.response});
}

final class AddTaskFailure extends TasksState {
  final String message;

  AddTaskFailure({required this.message});
}

// Complete Task
final class CompleteTaskLoading extends TasksState {}

final class CompleteTaskSuccess extends TasksState {
  final String response;

  CompleteTaskSuccess({required this.response});
}

final class CompleteTaskFailure extends TasksState {
  final String message;

  CompleteTaskFailure({required this.message});
}

// Delete Task
final class DeleteTaskLoading extends TasksState {}

final class DeleteTaskSuccess extends TasksState {
  final String response;

  DeleteTaskSuccess({required this.response});
}

final class DeleteTaskFailure extends TasksState {
  final String message;

  DeleteTaskFailure({required this.message});
}
