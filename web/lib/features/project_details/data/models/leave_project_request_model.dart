import 'package:site_sync/features/project_details/domain/entities/leave_project_request_entity.dart';

class LeaveProjectRequestModel extends LeaveProjectRequestEntity {
  LeaveProjectRequestModel({
    required super.uid,
    required super.userId,
  });

  factory LeaveProjectRequestModel.fromJson(Map<String, dynamic> json) {
    return LeaveProjectRequestModel(
      uid: json['uid'],
      userId: json['user_id'],
    );
  }
}