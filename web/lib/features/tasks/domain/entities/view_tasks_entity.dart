/// message : "Tasks retrieved successfully."
/// status_code : 200
/// data : [{"task_name":"Drill holes","due_date":"2024-11-02","countdown":0,"status":"Ongoing","assigned_to":["John Doe "]},{"task_name":"abc","due_date":"2024-11-08","countdown":6,"status":"Ongoing","assigned_to":["John Doe "]}]

class ViewTasksEntity {
  ViewTasksEntity({
    String? message,
    num? statusCode,
    List<TaskDataEntity>? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  ViewTasksEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TaskDataEntity.fromJson(v));
      });
    }
  }

  String? _message;
  num? _statusCode;
  List<TaskDataEntity>? _data;

  ViewTasksEntity copyWith({
    String? message,
    num? statusCode,
    List<TaskDataEntity>? data,
  }) =>
      ViewTasksEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  List<TaskDataEntity>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// task_name : "Drill holes"
/// due_date : "2024-11-02"
/// countdown : 0
/// status : "Ongoing"
/// assigned_to : ["John Doe "]

class TaskDataEntity {
  TaskDataEntity({
    String? taskName,
    num? taskId,
    String? dueDate,
    dynamic countdown,
    String? status,
    List<String>? assignedTo,
  }) {
    _taskName = taskName;
    _taskId = taskId;
    _dueDate = dueDate;
    _countdown = countdown;
    _status = status;
    _assignedTo = assignedTo;
  }

  TaskDataEntity.fromJson(dynamic json) {
    _taskName = json['task_name'];
    _taskId = json['task_id'];
    _dueDate = json['due_date'];
    _countdown = json['countdown'];
    _status = json['status'];
    _assignedTo =
        json['assigned_to'] != null ? json['assigned_to'].cast<String>() : [];
  }

  String? _taskName;
  num? _taskId;
  String? _dueDate;
  dynamic _countdown;
  String? _status;
  List<String>? _assignedTo;

  TaskDataEntity copyWith({
    String? taskName,
    num? taskId,
    String? dueDate,
    dynamic countdown,
    String? status,
    List<String>? assignedTo,
  }) =>
      TaskDataEntity(
        taskName: taskName ?? _taskName,
        taskId: taskId ?? _taskId,
        dueDate: dueDate ?? _dueDate,
        countdown: countdown ?? _countdown,
        status: status ?? _status,
        assignedTo: assignedTo ?? _assignedTo,
      );

  String? get taskName => _taskName;

  num? get taskId => _taskId;

  String? get dueDate => _dueDate;

  dynamic get countdown => _countdown;

  String? get status => _status;

  List<String>? get assignedTo => _assignedTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['task_name'] = _taskName;
    map['task_id'] = _taskId;
    map['due_date'] = _dueDate;
    map['countdown'] = _countdown;
    map['status'] = _status;
    map['assigned_to'] = _assignedTo;
    return map;
  }
}
