import 'package:site_sync/features/tasks/domain/entities/delete_task_response_entity.dart';

class DeleteTaskResponseModel extends DeleteTaskResponseEntity {
  DeleteTaskResponseModel({
    required super.message,
    required super.statusCode,
  });

  factory DeleteTaskResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteTaskResponseModel(
      message: json['message'],
      statusCode: json['status_code'],
    );
  }
}
