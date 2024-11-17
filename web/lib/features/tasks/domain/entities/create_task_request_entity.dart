/// task_name : "Test"
/// task_details : "This is a test task"
/// due_date : "2024-11-15"
/// transaction_price : 500.00
/// members : [14]
/// dependent_task : null

class CreateTaskRequestEntity {
  CreateTaskRequestEntity({
    String? userId,
    String? taskName,
    String? taskDetails,
    String? dueDate,
    num? transactionPrice,
    List<num>? members,
    dynamic dependentTask,
  }) {
    _userId = userId;
    _taskName = taskName;
    _taskDetails = taskDetails;
    _dueDate = dueDate;
    _transactionPrice = transactionPrice;
    _members = members;
    _dependentTask = dependentTask;
  }

  CreateTaskRequestEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _taskName = json['task_name'];
    _taskDetails = json['task_details'];
    _dueDate = json['due_date'];
    _transactionPrice = json['transaction_price'];
    _members = json['members'] != null ? json['members'].cast<num>() : [];
    _dependentTask = json['dependent_task'];
  }

  String? _userId;
  String? _taskName;
  String? _taskDetails;
  String? _dueDate;
  num? _transactionPrice;
  List<num>? _members;
  dynamic _dependentTask;

  CreateTaskRequestEntity copyWith({
    String? userId,
    String? taskName,
    String? taskDetails,
    String? dueDate,
    num? transactionPrice,
    List<num>? members,
    dynamic dependentTask,
  }) =>
      CreateTaskRequestEntity(
        userId: userId ?? _userId,
        taskName: taskName ?? _taskName,
        taskDetails: taskDetails ?? _taskDetails,
        dueDate: dueDate ?? _dueDate,
        transactionPrice: transactionPrice ?? _transactionPrice,
        members: members ?? _members,
        dependentTask: dependentTask ?? _dependentTask,
      );

  String? get userId => _userId;

  String? get taskName => _taskName;

  String? get taskDetails => _taskDetails;

  String? get dueDate => _dueDate;

  num? get transactionPrice => _transactionPrice;

  List<num>? get members => _members;

  dynamic get dependentTask => _dependentTask;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['task_name'] = _taskName;
    map['task_details'] = _taskDetails;
    map['due_date'] = _dueDate;
    map['transaction_price'] = _transactionPrice;
    map['members'] = _members;
    map['dependent_task'] = _dependentTask;
    return map;
  }
}
