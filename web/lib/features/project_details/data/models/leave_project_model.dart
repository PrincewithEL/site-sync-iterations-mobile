import 'package:site_sync/features/project_details/domain/entities/leave_project_entity.dart';

class LeaveProjectResponseModel extends LeaveProjectResponseEntity {
  LeaveProjectResponseModel({
    required super.message,
    required super.data,
    required super.statusCode,
  });

  factory LeaveProjectResponseModel.fromJson(Map<String, dynamic> json) {
    return LeaveProjectResponseModel(
      message: json['message'],
      data: json['data'],
      statusCode: json['status_code'],
    );
  }
}