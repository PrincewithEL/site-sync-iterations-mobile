import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';

class ProjectsDetailsResponseModel extends ProjectsDetailsResponseEntity {
  ProjectsDetailsResponseModel({
    required super.data,
    required super.statusCode,
    required super.message,
  });

  factory ProjectsDetailsResponseModel.fromJson(final Map<String, dynamic> json) {
    return ProjectsDetailsResponseModel(
      data: json['data'] != null ? DataModel.fromJson(json['data'] as Map<String, dynamic>) : null,
      statusCode: json["status_code"],
      message: json["message"],
    );
  }
}

class DataModel extends DataEntity {
  DataModel({
    required super.allProjects,
    required super.user,
    required super.allProjectsCount,
    required super.userName,
  });

  factory DataModel.fromJson(final Map<String, dynamic> json) {
    return DataModel(
      allProjects: (json["all_projects"] as List?)
          ?.map((v) => ProjectDataModel.fromJson(v))
          .toList() ?? [],
      user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
      allProjectsCount: json["all_projects_count"] ?? 0,
      userName: json["user_name"] ?? '',
    );
  }
}

class UserModel extends User {
  UserModel({
    required super.profilePicture,
    required super.userType,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) {
    return UserModel(
      userType: json["user_type"],
      profilePicture: json["profile_picture"],
    );
  }
}

class ProjectDataModel extends ProjectsDataEntity {
  ProjectDataModel({
    required super.projectId,
    required super.projectName,
    required super.startDate,
    required super.endDate,
    required super.projectDetails,
    required super.estimatedBudget,
    required super.chats,
    required super.tasks,
    required super.projectpercentage,
  });

  factory ProjectDataModel.fromJson(final Map<String, dynamic> json) {
    return ProjectDataModel(
      projectId: json["project_id"],
      projectDetails: json["project_details"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      projectName: json["project_name"],
      projectpercentage: json["projectpercentage"],
      chats: json["chats"],
      tasks: json["tasks"],
      estimatedBudget: json["estimated_budget"],
    );
  }
}
