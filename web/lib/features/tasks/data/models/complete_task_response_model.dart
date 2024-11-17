import 'package:site_sync/features/tasks/domain/entities/complete_task_response_entity.dart';

class CompleteTaskResponseModel extends CompleteTaskResponseEntity {
  CompleteTaskResponseModel({
    required super.statusCode,
    required super.message,
    required super.task,
  });

  factory CompleteTaskResponseModel.fromJson(Map<String, dynamic> json) {
    return CompleteTaskResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
      task: CompleteTaskModel.fromJson(json['task'] as Map<String, dynamic>),
    );
  }
}

class CompleteTaskModel extends CompleteTaskEntity {
  CompleteTaskModel({
    required super.deletedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.dependantTaskId,
    required super.dependantTasks,
    required super.isDeleted,
    required super.leader,
    required super.member,
    required super.taskDaysOverdue,
    required super.project,
    required super.taskCompletedDate,
    required super.taskDaysLeft,
    required super.taskId,
    required super.taskDetails,
    required super.taskDueDate,
    required super.taskGivenDate,
    required super.taskName,
    required super.taskPercentageComplete,
    required super.taskStatus,
    required super.taskTransactionPrice,
  });

  factory CompleteTaskModel.fromJson(Map<String, dynamic> json) {
    return CompleteTaskModel(
      taskId: json['task_id'],
      dependantTaskId: json['dependant_task_id'],
      taskName: json['task_name'],
      taskDetails: json['task_details'],
      taskGivenDate: json['task_given_date'],
      taskDueDate: json['task_due_date'],
      taskCompletedDate: json['task_completed_date'],
      taskDaysLeft: json['task_days_left'],
      taskDaysOverdue: json['task_days_overdue'],
      taskPercentageComplete: json['task_percentage_complete'],
      taskStatus: json['task_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isDeleted: json['is_deleted'],
      taskTransactionPrice: json['task_transaction_price'],
      deletedAt: json['deleted_at'],
      leader: json['leader'],
      project: json['project'],
      member: json['member'] != null
          ? List<num>.from(json['member'])
          : [],
      dependantTasks: json['dependant_tasks'] != null
          ? List<num>.from(json['dependant_tasks'])
          : [],
    );
  }
}
