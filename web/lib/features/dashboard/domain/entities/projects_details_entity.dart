/// status_code : 200
/// message : "Projects retrieved successfully."
/// data : {"user":{"user_type":"Client","profile_picture":"/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg"},"user_name":"John Doe","all_projects":[{"project_id":1,"project_name":"Test","start_date":"2024-10-28","end_date":"2024-12-31","project_details":"dhjhjdhjhd","estimated_budget":300000000.0,"chats":0,"tasks":0,"projectpercentage":0}],"all_projects_count":1}

class ProjectsDetailsResponseEntity {

  num? _statusCode;
  String? _message;
  DataEntity? _data;

  num? get statusCode => _statusCode;

  String? get message => _message;

  DataEntity? get data => _data;


  ProjectsDetailsResponseEntity({
    num? statusCode,
    String? message,
    DataEntity? data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  ProjectsDetailsResponseEntity.fromJson(dynamic json) {
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? DataEntity.fromJson(json['data']) : null;
  }

  ProjectsDetailsResponseEntity copyWith({
    num? statusCode,
    String? message,
    DataEntity? data,
  }) =>
      ProjectsDetailsResponseEntity(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        data: data ?? _data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// user : {"user_type":"Client","profile_picture":"/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg"}
/// user_name : "John Doe"
/// all_projects : [{"project_id":1,"project_name":"Test","start_date":"2024-10-28","end_date":"2024-12-31","project_details":"dhjhjdhjhd","estimated_budget":300000000.0,"chats":0,"tasks":0,"projectpercentage":0}]
/// all_projects_count : 1

class DataEntity {
  DataEntity({
    User? user,
    String? userName,
    List<ProjectsDataEntity>? allProjects,
    num? allProjectsCount,
  }) {
    _user = user;
    _userName = userName;
    _allProjects = allProjects;
    _allProjectsCount = allProjectsCount;
  }

  DataEntity.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _userName = json['user_name'];
    if (json['all_projects'] != null) {
      _allProjects = [];
      json['all_projects'].forEach((v) {
        _allProjects?.add(ProjectsDataEntity.fromJson(v));
      });
    }
    _allProjectsCount = json['all_projects_count'];
  }

  User? _user;
  String? _userName;
  List<ProjectsDataEntity>? _allProjects;
  num? _allProjectsCount;

  DataEntity copyWith({
    User? user,
    String? userName,
    List<ProjectsDataEntity>? allProjects,
    num? allProjectsCount,
  }) =>
      DataEntity(
        user: user ?? _user,
        userName: userName ?? _userName,
        allProjects: allProjects ?? _allProjects,
        allProjectsCount: allProjectsCount ?? _allProjectsCount,
      );

  User? get user => _user;

  String? get userName => _userName;

  List<ProjectsDataEntity>? get allProjects => _allProjects;

  num? get allProjectsCount => _allProjectsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['user_name'] = _userName;
    if (_allProjects != null) {
      map['all_projects'] = _allProjects?.map((v) => v.toJson()).toList();
    }
    map['all_projects_count'] = _allProjectsCount;
    return map;
  }
}

/// project_id : 1
/// project_name : "Test"
/// start_date : "2024-10-28"
/// end_date : "2024-12-31"
/// project_details : "dhjhjdhjhd"
/// estimated_budget : 300000000.0
/// chats : 0
/// tasks : 0
/// projectpercentage : 0

class ProjectsDataEntity {
  ProjectsDataEntity({
    num? projectId,
    String? projectName,
    String? startDate,
    String? endDate,
    String? projectDetails,
    num? estimatedBudget,
    num? chats,
    num? tasks,
    num? projectpercentage,
  }) {
    _projectId = projectId;
    _projectName = projectName;
    _startDate = startDate;
    _endDate = endDate;
    _projectDetails = projectDetails;
    _estimatedBudget = estimatedBudget;
    _chats = chats;
    _tasks = tasks;
    _projectpercentage = projectpercentage;
  }

  ProjectsDataEntity.fromJson(dynamic json) {
    _projectId = json['project_id'];
    _projectName = json['project_name'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _projectDetails = json['project_details'];
    _estimatedBudget = json['estimated_budget'];
    _chats = json['chats'];
    _tasks = json['tasks'];
    _projectpercentage = json['projectpercentage'];
  }

  num? _projectId;
  String? _projectName;
  String? _startDate;
  String? _endDate;
  String? _projectDetails;
  num? _estimatedBudget;
  num? _chats;
  num? _tasks;
  num? _projectpercentage;

  ProjectsDataEntity copyWith({
    num? projectId,
    String? projectName,
    String? startDate,
    String? endDate,
    String? projectDetails,
    num? estimatedBudget,
    num? chats,
    num? tasks,
    num? projectpercentage,
  }) =>
      ProjectsDataEntity(
        projectId: projectId ?? _projectId,
        projectName: projectName ?? _projectName,
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        projectDetails: projectDetails ?? _projectDetails,
        estimatedBudget: estimatedBudget ?? _estimatedBudget,
        chats: chats ?? _chats,
        tasks: tasks ?? _tasks,
        projectpercentage: projectpercentage ?? _projectpercentage,
      );

  num? get projectId => _projectId;

  String? get projectName => _projectName;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get projectDetails => _projectDetails;

  num? get estimatedBudget => _estimatedBudget;

  num? get chats => _chats;

  num? get tasks => _tasks;

  num? get projectpercentage => _projectpercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['project_id'] = _projectId;
    map['project_name'] = _projectName;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['project_details'] = _projectDetails;
    map['estimated_budget'] = _estimatedBudget;
    map['chats'] = _chats;
    map['tasks'] = _tasks;
    map['projectpercentage'] = _projectpercentage;
    return map;
  }
}

/// user_type : "Client"
/// profile_picture : "/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg"

class User {
  User({
    String? userType,
    String? profilePicture,
  }) {
    _userType = userType;
    _profilePicture = profilePicture;
  }

  User.fromJson(dynamic json) {
    _userType = json['user_type'];
    _profilePicture = json['profile_picture'];
  }

  String? _userType;
  String? _profilePicture;

  User copyWith({
    String? userType,
    String? profilePicture,
  }) =>
      User(
        userType: userType ?? _userType,
        profilePicture: profilePicture ?? _profilePicture,
      );

  String? get userType => _userType;

  String? get profilePicture => _profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_type'] = _userType;
    map['profile_picture'] = _profilePicture;
    return map;
  }
}
