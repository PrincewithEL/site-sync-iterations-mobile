part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class ViewTask extends TasksEvent {
  final String projectId;

  ViewTask({
    required this.projectId,
  });
}

final class AddTask extends TasksEvent {
  final String projectId;
  final String taskName;
  final String taskDetails;
  final String dueDate;
  final String transactionPrice;
  final List<num> members;
  final String dependentTask;

  AddTask({
    
    required this.projectId,
    required this.taskName,
    required this.taskDetails,
    required this.dueDate,
    required this.transactionPrice,
    required this.members,
    required this.dependentTask,
  });
}

final class CompleteTask extends TasksEvent {
  final String projectId;
  final String taskId;

  CompleteTask({
    required this.projectId,
    required this.taskId,
  });
}

final class DeleteTask extends TasksEvent {
  final String projectId;
  final String taskId;

  DeleteTask({
    required this.projectId,
    required this.taskId,
  });
}
