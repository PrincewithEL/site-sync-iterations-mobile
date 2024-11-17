import 'package:site_sync/features/tasks/domain/entities/view_tasks_entity.dart';

class ViewTasksModel extends ViewTasksEntity {
  ViewTasksModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory ViewTasksModel.fromJson(final Map<String, dynamic> json) {
    return ViewTasksModel(
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((item) =>
                  TaskDataModel.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      message: json["message"],
      statusCode: json["status_code"],
    );
  }
}

class TaskDataModel extends TaskDataEntity {
  TaskDataModel({
    required super.assignedTo,
    required super.countdown,
    required super.dueDate,
    required super.status,
    required super.taskName,
    required super.taskId,
  });

  factory TaskDataModel.fromJson(final Map<String, dynamic> json) {
    return TaskDataModel(
      assignedTo: json['assigned_to'] != null
          ? List<String>.from(json['assigned_to'] as List)
          : null,
      countdown: json["countdown"],
      dueDate: json["due_date"],
      status: json["status"],
      taskName: json["task_name"],
      taskId: json["task_id"],
    );
  }
}
