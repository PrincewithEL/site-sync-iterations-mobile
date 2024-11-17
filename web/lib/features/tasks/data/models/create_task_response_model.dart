import 'package:site_sync/features/tasks/domain/entities/create_task_response_entity.dart';

class CreateTaskResponseModel extends CreateTaskResponseEntity {
  CreateTaskResponseModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory CreateTaskResponseModel.fromJson(final Map<String, dynamic> json) {
    return CreateTaskResponseModel(
      data: json['data'] != null ? CreateTaskDataModel.fromJson(json['data'] as Map<String, dynamic>) : null,
      message: json["message"],
      statusCode: json["status_code"],
    );
  }
}

class CreateTaskDataModel extends CreateTaskDataEntity {
  CreateTaskDataModel({
    required super.createdAt,
    required super.deletedAt,
    required super.dependantTaskId,
    required super.dependantTasks,
    required super.isDeleted,
    required super.leader,
    required super.member,
    required super.project,
    required super.taskCompletedDate,
    required super.taskDaysLeft,
    required super.taskDaysOverdue,
    required super.taskDetails,
    required super.taskDueDate,
    required super.taskGivenDate,
    required super.taskId,
    required super.taskName,
    required super.taskPercentageComplete,
    required super.taskStatus,
    required super.taskTransactionPrice,
    required super.updatedAt,
  });

  factory CreateTaskDataModel.fromJson(final Map<String, dynamic> json) {
    return CreateTaskDataModel(
      createdAt: json["created_at"],
      deletedAt: json["deleted_at"],
      dependantTaskId: json["dependant_task_id"],
      dependantTasks: json["dependant_tasks"],
      isDeleted: json["is_deleted"],
      leader: json["leader"],
      member: json["member"],
      project: json["project"],
      taskCompletedDate: json["task_completed_date"],
      taskDaysLeft: json["task_days_left"],
      taskDaysOverdue: json["task_days_overdue"],
      taskDetails: json["task_details"],
      taskDueDate: json["task_due_date"],
      taskGivenDate: json["task_given_date"],
      taskId: json["task_id"],
      taskName: json["task_name"],
      taskPercentageComplete: json["task_percentage_complete"],
      taskStatus: json["task_status"],
      taskTransactionPrice: json["task_transaction_price"],
      updatedAt: json["updated_at"],
    );
  }
}
