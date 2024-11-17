/// project_name : "New Project"
/// project_details : "Details of the new project."
/// start_date : "2024-10-15"
/// end_date : "2024-11-15"
/// estimated_budget : "5000"
/// project_image : "<uploaded file>"

class CreateProjectEntity {
  CreateProjectEntity({
    String? projectName,
    String? projectDetails,
    String? startDate,
    String? endDate,
    String? estimatedBudget,
    String? projectImage,
  }) {
    _projectName = projectName;
    _projectDetails = projectDetails;
    _startDate = startDate;
    _endDate = endDate;
    _estimatedBudget = estimatedBudget;
    _projectImage = projectImage;
  }

  CreateProjectEntity.fromJson(dynamic json) {
    _projectName = json['project_name'];
    _projectDetails = json['project_details'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _estimatedBudget = json['estimated_budget'];
    _projectImage = json['project_image'];
  }

  String? _projectName;
  String? _projectDetails;
  String? _startDate;
  String? _endDate;
  String? _estimatedBudget;
  String? _projectImage;

  CreateProjectEntity copyWith({
    String? projectName,
    String? projectDetails,
    String? startDate,
    String? endDate,
    String? estimatedBudget,
    String? projectImage,
  }) =>
      CreateProjectEntity(
        projectName: projectName ?? _projectName,
        projectDetails: projectDetails ?? _projectDetails,
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        estimatedBudget: estimatedBudget ?? _estimatedBudget,
        projectImage: projectImage ?? _projectImage,
      );

  String? get projectName => _projectName;

  String? get projectDetails => _projectDetails;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get estimatedBudget => _estimatedBudget;

  String? get projectImage => _projectImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['project_name'] = _projectName;
    map['project_details'] = _projectDetails;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['estimated_budget'] = _estimatedBudget;
    map['project_image'] = _projectImage;
    return map;
  }
}
