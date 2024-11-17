/// message : "Transactions retrieved successfully."
/// data : [{"transaction_id":4,"transaction_name":"abc","transaction_details":"abc","transaction_price":10.0,"transaction_quantity":100,"transaction_category":"Internal","transaction_type":"Salary","total_transaction_price":1000.0,"created_at":"2024-10-30T20:46:55.469642+03:00","transaction_date":"2024-10-30","transaction_time":"Cubic Meters","updated_at":null,"transaction_status":"Completed","is_deleted":0,"deleted_at":null,"user":4,"project":5,"task":null},{"transaction_id":5,"transaction_name":"Drill holes","transaction_details":"drill a lot","transaction_price":5000.0,"transaction_quantity":1,"transaction_category":"External","transaction_type":"Machinery","total_transaction_price":5000.0,"created_at":"2024-10-30T20:51:43.425992+03:00","transaction_date":"","transaction_time":"","updated_at":null,"transaction_status":"Completed","is_deleted":0,"deleted_at":null,"user":4,"project":5,"task":2},{"transaction_id":6,"transaction_name":"abc","transaction_details":"abc","transaction_price":1.0,"transaction_quantity":1,"transaction_category":"Internal","transaction_type":"Salary","total_transaction_price":1.0,"created_at":"2024-10-30T20:52:01.575169+03:00","transaction_date":"","transaction_time":"","updated_at":null,"transaction_status":"Completed","is_deleted":0,"deleted_at":null,"user":4,"project":5,"task":3}]
/// status_code : 200

class TransactionsResponseEntity {
  TransactionsResponseEntity({
      String? message, 
      List<TransactionDataEntity>? data,
      num? statusCode,}){
    _message = message;
    _data = data;
    _statusCode = statusCode;
}

  TransactionsResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TransactionDataEntity.fromJson(v));
      });
    }
    _statusCode = json['status_code'];
  }
  String? _message;
  List<TransactionDataEntity>? _data;
  num? _statusCode;
TransactionsResponseEntity copyWith({  String? message,
  List<TransactionDataEntity>? data,
  num? statusCode,
}) => TransactionsResponseEntity(  message: message ?? _message,
  data: data ?? _data,
  statusCode: statusCode ?? _statusCode,
);
  String? get message => _message;
  List<TransactionDataEntity>? get data => _data;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = _statusCode;
    return map;
  }

}

/// transaction_id : 4
/// transaction_name : "abc"
/// transaction_details : "abc"
/// transaction_price : 10.0
/// transaction_quantity : 100
/// transaction_category : "Internal"
/// transaction_type : "Salary"
/// total_transaction_price : 1000.0
/// created_at : "2024-10-30T20:46:55.469642+03:00"
/// transaction_date : "2024-10-30"
/// transaction_time : "Cubic Meters"
/// updated_at : null
/// transaction_status : "Completed"
/// is_deleted : 0
/// deleted_at : null
/// user : 4
/// project : 5
/// task : null

class TransactionDataEntity {
  TransactionDataEntity({
      num? transactionId, 
      String? transactionName, 
      String? transactionDetails, 
      num? transactionPrice, 
      num? transactionQuantity, 
      String? transactionCategory, 
      String? transactionType, 
      num? totalTransactionPrice, 
      String? createdAt, 
      String? transactionDate, 
      String? transactionTime, 
      dynamic updatedAt, 
      String? transactionStatus, 
      num? isDeleted, 
      dynamic deletedAt, 
      num? user, 
      num? project, 
      dynamic task,}){
    _transactionId = transactionId;
    _transactionName = transactionName;
    _transactionDetails = transactionDetails;
    _transactionPrice = transactionPrice;
    _transactionQuantity = transactionQuantity;
    _transactionCategory = transactionCategory;
    _transactionType = transactionType;
    _totalTransactionPrice = totalTransactionPrice;
    _createdAt = createdAt;
    _transactionDate = transactionDate;
    _transactionTime = transactionTime;
    _updatedAt = updatedAt;
    _transactionStatus = transactionStatus;
    _isDeleted = isDeleted;
    _deletedAt = deletedAt;
    _user = user;
    _project = project;
    _task = task;
}

  TransactionDataEntity.fromJson(dynamic json) {
    _transactionId = json['transaction_id'];
    _transactionName = json['transaction_name'];
    _transactionDetails = json['transaction_details'];
    _transactionPrice = json['transaction_price'];
    _transactionQuantity = json['transaction_quantity'];
    _transactionCategory = json['transaction_category'];
    _transactionType = json['transaction_type'];
    _totalTransactionPrice = json['total_transaction_price'];
    _createdAt = json['created_at'];
    _transactionDate = json['transaction_date'];
    _transactionTime = json['transaction_time'];
    _updatedAt = json['updated_at'];
    _transactionStatus = json['transaction_status'];
    _isDeleted = json['is_deleted'];
    _deletedAt = json['deleted_at'];
    _user = json['user'];
    _project = json['project'];
    _task = json['task'];
  }
  num? _transactionId;
  String? _transactionName;
  String? _transactionDetails;
  num? _transactionPrice;
  num? _transactionQuantity;
  String? _transactionCategory;
  String? _transactionType;
  num? _totalTransactionPrice;
  String? _createdAt;
  String? _transactionDate;
  String? _transactionTime;
  dynamic _updatedAt;
  String? _transactionStatus;
  num? _isDeleted;
  dynamic _deletedAt;
  num? _user;
  num? _project;
  dynamic _task;
TransactionDataEntity copyWith({  num? transactionId,
  String? transactionName,
  String? transactionDetails,
  num? transactionPrice,
  num? transactionQuantity,
  String? transactionCategory,
  String? transactionType,
  num? totalTransactionPrice,
  String? createdAt,
  String? transactionDate,
  String? transactionTime,
  dynamic updatedAt,
  String? transactionStatus,
  num? isDeleted,
  dynamic deletedAt,
  num? user,
  num? project,
  dynamic task,
}) => TransactionDataEntity(  transactionId: transactionId ?? _transactionId,
  transactionName: transactionName ?? _transactionName,
  transactionDetails: transactionDetails ?? _transactionDetails,
  transactionPrice: transactionPrice ?? _transactionPrice,
  transactionQuantity: transactionQuantity ?? _transactionQuantity,
  transactionCategory: transactionCategory ?? _transactionCategory,
  transactionType: transactionType ?? _transactionType,
  totalTransactionPrice: totalTransactionPrice ?? _totalTransactionPrice,
  createdAt: createdAt ?? _createdAt,
  transactionDate: transactionDate ?? _transactionDate,
  transactionTime: transactionTime ?? _transactionTime,
  updatedAt: updatedAt ?? _updatedAt,
  transactionStatus: transactionStatus ?? _transactionStatus,
  isDeleted: isDeleted ?? _isDeleted,
  deletedAt: deletedAt ?? _deletedAt,
  user: user ?? _user,
  project: project ?? _project,
  task: task ?? _task,
);
  num? get transactionId => _transactionId;
  String? get transactionName => _transactionName;
  String? get transactionDetails => _transactionDetails;
  num? get transactionPrice => _transactionPrice;
  num? get transactionQuantity => _transactionQuantity;
  String? get transactionCategory => _transactionCategory;
  String? get transactionType => _transactionType;
  num? get totalTransactionPrice => _totalTransactionPrice;
  String? get createdAt => _createdAt;
  String? get transactionDate => _transactionDate;
  String? get transactionTime => _transactionTime;
  dynamic get updatedAt => _updatedAt;
  String? get transactionStatus => _transactionStatus;
  num? get isDeleted => _isDeleted;
  dynamic get deletedAt => _deletedAt;
  num? get user => _user;
  num? get project => _project;
  dynamic get task => _task;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transaction_id'] = _transactionId;
    map['transaction_name'] = _transactionName;
    map['transaction_details'] = _transactionDetails;
    map['transaction_price'] = _transactionPrice;
    map['transaction_quantity'] = _transactionQuantity;
    map['transaction_category'] = _transactionCategory;
    map['transaction_type'] = _transactionType;
    map['total_transaction_price'] = _totalTransactionPrice;
    map['created_at'] = _createdAt;
    map['transaction_date'] = _transactionDate;
    map['transaction_time'] = _transactionTime;
    map['updated_at'] = _updatedAt;
    map['transaction_status'] = _transactionStatus;
    map['is_deleted'] = _isDeleted;
    map['deleted_at'] = _deletedAt;
    map['user'] = _user;
    map['project'] = _project;
    map['task'] = _task;
    return map;
  }

}