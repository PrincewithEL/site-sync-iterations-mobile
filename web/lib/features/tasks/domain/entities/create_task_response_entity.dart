/// message : "Task added successfully."
/// status_code : 201
/// data : {"task_id":8,"dependant_task_id":null,"task_name":"Test","task_details":"This is a test task","task_given_date":"2024-11-01","task_due_date":"2024-11-15","task_completed_date":null,"task_days_left":14,"task_days_overdue":0,"task_percentage_complete":0.0,"task_status":"Ongoing","created_at":"2024-11-01T22:46:07.431277+03:00","updated_at":null,"is_deleted":0,"task_transaction_price":500.0,"deleted_at":null,"leader":2,"project":1,"member":[],"dependant_tasks":[]}

class CreateTaskResponseEntity {
  CreateTaskResponseEntity({
    String? message,
    num? statusCode,
    CreateTaskDataEntity? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  CreateTaskResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'] != null
        ? CreateTaskDataEntity.fromJson(json['data'])
        : null;
  }

  String? _message;
  num? _statusCode;
  CreateTaskDataEntity? _data;

  CreateTaskResponseEntity copyWith({
    String? message,
    num? statusCode,
    CreateTaskDataEntity? data,
  }) =>
      CreateTaskResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  CreateTaskDataEntity? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// task_id : 8
/// dependant_task_id : null
/// task_name : "Test"
/// task_details : "This is a test task"
/// task_given_date : "2024-11-01"
/// task_due_date : "2024-11-15"
/// task_completed_date : null
/// task_days_left : 14
/// task_days_overdue : 0
/// task_percentage_complete : 0.0
/// task_status : "Ongoing"
/// created_at : "2024-11-01T22:46:07.431277+03:00"
/// updated_at : null
/// is_deleted : 0
/// task_transaction_price : 500.0
/// deleted_at : null
/// leader : 2
/// project : 1
/// member : []
/// dependant_tasks : []

class CreateTaskDataEntity {
  CreateTaskDataEntity({
    num? taskId,
    dynamic dependantTaskId,
    String? taskName,
    String? taskDetails,
    String? taskGivenDate,
    String? taskDueDate,
    dynamic taskCompletedDate,
    num? taskDaysLeft,
    num? taskDaysOverdue,
    num? taskPercentageComplete,
    String? taskStatus,
    String? createdAt,
    dynamic updatedAt,
    num? isDeleted,
    num? taskTransactionPrice,
    dynamic deletedAt,
    num? leader,
    num? project,
    List<dynamic>? member,
    List<dynamic>? dependantTasks,
  }) {
    _taskId = taskId;
    _dependantTaskId = dependantTaskId;
    _taskName = taskName;
    _taskDetails = taskDetails;
    _taskGivenDate = taskGivenDate;
    _taskDueDate = taskDueDate;
    _taskCompletedDate = taskCompletedDate;
    _taskDaysLeft = taskDaysLeft;
    _taskDaysOverdue = taskDaysOverdue;
    _taskPercentageComplete = taskPercentageComplete;
    _taskStatus = taskStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isDeleted = isDeleted;
    _taskTransactionPrice = taskTransactionPrice;
    _deletedAt = deletedAt;
    _leader = leader;
    _project = project;
    _member = member;
    _dependantTasks = dependantTasks;
  }

  CreateTaskDataEntity.fromJson(dynamic json) {
    _taskId = json['task_id'];
    _dependantTaskId = json['dependant_task_id'];
    _taskName = json['task_name'];
    _taskDetails = json['task_details'];
    _taskGivenDate = json['task_given_date'];
    _taskDueDate = json['task_due_date'];
    _taskCompletedDate = json['task_completed_date'];
    _taskDaysLeft = json['task_days_left'];
    _taskDaysOverdue = json['task_days_overdue'];
    _taskPercentageComplete = json['task_percentage_complete'];
    _taskStatus = json['task_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isDeleted = json['is_deleted'];
    _taskTransactionPrice = json['task_transaction_price'];
    _deletedAt = json['deleted_at'];
    _leader = json['leader'];
    _project = json['project'];
    if (json['member'] != null) {
      _member = [];
      json['member'].forEach((v) {
        _member?.add(v);
      });
    }
    if (json['dependant_tasks'] != null) {
      _dependantTasks = [];
      json['dependant_tasks'].forEach((v) {
        _dependantTasks?.add(v);
      });
    }
  }

  num? _taskId;
  dynamic _dependantTaskId;
  String? _taskName;
  String? _taskDetails;
  String? _taskGivenDate;
  String? _taskDueDate;
  dynamic _taskCompletedDate;
  num? _taskDaysLeft;
  num? _taskDaysOverdue;
  num? _taskPercentageComplete;
  String? _taskStatus;
  String? _createdAt;
  dynamic _updatedAt;
  num? _isDeleted;
  num? _taskTransactionPrice;
  dynamic _deletedAt;
  num? _leader;
  num? _project;
  List<dynamic>? _member;
  List<dynamic>? _dependantTasks;

  CreateTaskDataEntity copyWith({
    num? taskId,
    dynamic dependantTaskId,
    String? taskName,
    String? taskDetails,
    String? taskGivenDate,
    String? taskDueDate,
    dynamic taskCompletedDate,
    num? taskDaysLeft,
    num? taskDaysOverdue,
    num? taskPercentageComplete,
    String? taskStatus,
    String? createdAt,
    dynamic updatedAt,
    num? isDeleted,
    num? taskTransactionPrice,
    dynamic deletedAt,
    num? leader,
    num? project,
    List<String>? member,
    List<String>? dependantTasks,
  }) =>
      CreateTaskDataEntity(
        taskId: taskId ?? _taskId,
        dependantTaskId: dependantTaskId ?? _dependantTaskId,
        taskName: taskName ?? _taskName,
        taskDetails: taskDetails ?? _taskDetails,
        taskGivenDate: taskGivenDate ?? _taskGivenDate,
        taskDueDate: taskDueDate ?? _taskDueDate,
        taskCompletedDate: taskCompletedDate ?? _taskCompletedDate,
        taskDaysLeft: taskDaysLeft ?? _taskDaysLeft,
        taskDaysOverdue: taskDaysOverdue ?? _taskDaysOverdue,
        taskPercentageComplete:
            taskPercentageComplete ?? _taskPercentageComplete,
        taskStatus: taskStatus ?? _taskStatus,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        isDeleted: isDeleted ?? _isDeleted,
        taskTransactionPrice: taskTransactionPrice ?? _taskTransactionPrice,
        deletedAt: deletedAt ?? _deletedAt,
        leader: leader ?? _leader,
        project: project ?? _project,
        member: member ?? _member,
        dependantTasks: dependantTasks ?? _dependantTasks,
      );

  num? get taskId => _taskId;

  dynamic get dependantTaskId => _dependantTaskId;

  String? get taskName => _taskName;

  String? get taskDetails => _taskDetails;

  String? get taskGivenDate => _taskGivenDate;

  String? get taskDueDate => _taskDueDate;

  dynamic get taskCompletedDate => _taskCompletedDate;

  num? get taskDaysLeft => _taskDaysLeft;

  num? get taskDaysOverdue => _taskDaysOverdue;

  num? get taskPercentageComplete => _taskPercentageComplete;

  String? get taskStatus => _taskStatus;

  String? get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  num? get isDeleted => _isDeleted;

  num? get taskTransactionPrice => _taskTransactionPrice;

  dynamic get deletedAt => _deletedAt;

  num? get leader => _leader;

  num? get project => _project;

  List<dynamic>? get member => _member;

  List<dynamic>? get dependantTasks => _dependantTasks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['task_id'] = _taskId;
    map['dependant_task_id'] = _dependantTaskId;
    map['task_name'] = _taskName;
    map['task_details'] = _taskDetails;
    map['task_given_date'] = _taskGivenDate;
    map['task_due_date'] = _taskDueDate;
    map['task_completed_date'] = _taskCompletedDate;
    map['task_days_left'] = _taskDaysLeft;
    map['task_days_overdue'] = _taskDaysOverdue;
    map['task_percentage_complete'] = _taskPercentageComplete;
    map['task_status'] = _taskStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_deleted'] = _isDeleted;
    map['task_transaction_price'] = _taskTransactionPrice;
    map['deleted_at'] = _deletedAt;
    map['leader'] = _leader;
    map['project'] = _project;
    if (_member != null) {
      map['member'] = _member?.map((v) => v).toList();
    }
    if (_dependantTasks != null) {
      map['dependant_tasks'] = _dependantTasks?.map((v) => v).toList();
    }
    return map;
  }
}
