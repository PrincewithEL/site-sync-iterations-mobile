import 'package:site_sync/features/tasks/domain/entities/create_task_request_entity.dart';

class CreateTaskRequestModel extends CreateTaskRequestEntity {
  CreateTaskRequestModel({
    required super.dependentTask,
    required super.dueDate,
    required super.members,
    required super.taskDetails,
    required super.taskName,
    required super.userId,
    required super.transactionPrice,
  });

  factory CreateTaskRequestModel.fromJson(final Map<String, dynamic> json) {
    return CreateTaskRequestModel(
      dependentTask: json["dependent_task"],
      dueDate: json["due_date"],
      transactionPrice: json["transaction_price"],
      taskName: json["task_name"],
      userId: json["user_id"],
      taskDetails: json["task_details"],
      members: json["members"],
    );
  }
}