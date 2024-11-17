import 'package:dio/dio.dart';
import 'package:site_sync/features/project_details/domain/entities/create_project_entity.dart';

class CreateProjectModel extends CreateProjectEntity {
  CreateProjectModel({
    required super.startDate,
    required super.endDate,
    required super.estimatedBudget,
    required super.projectDetails,
    required super.projectImage,
    required super.projectName,
  });

  factory CreateProjectModel.fromJson(final Map<String, dynamic> json) {
    return CreateProjectModel(
      startDate: json["start_date"],
      endDate: json["end_date"],
      estimatedBudget: json["estimated_budget"],
      projectDetails: json["project_details"],
      projectImage: json["project_image"],
      projectName: json["project_name"],
    );
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'start_date': startDate,
      'end_date': endDate,
      'estimated_budget': estimatedBudget,
      'project_details': projectDetails,
      'project_image': projectImage is String
          ? await MultipartFile.fromFile(
              projectImage!)
          : projectImage,
      'project_name': projectName,
    });
  }
}
