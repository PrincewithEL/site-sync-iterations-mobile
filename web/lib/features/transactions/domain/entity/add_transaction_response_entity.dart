/// message : "Transaction created successfully."
/// status_code : 201
/// data : {"transaction_id":16,"total_transaction_price":25.0}

class AddTransactionResponseEntity {
  AddTransactionResponseEntity({
    String? message,
    num? statusCode,
    AddTransactionData? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  AddTransactionResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'] != null ? AddTransactionData.fromJson(json['data']) : null;
  }

  String? _message;
  num? _statusCode;
  AddTransactionData? _data;

  AddTransactionResponseEntity copyWith({
    String? message,
    num? statusCode,
    AddTransactionData? data,
  }) =>
      AddTransactionResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  AddTransactionData? get data => _data;

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

/// transaction_id : 16
/// total_transaction_price : 25.0

class AddTransactionData {
  AddTransactionData({
    num? transactionId,
    num? totalTransactionPrice,
  }) {
    _transactionId = transactionId;
    _totalTransactionPrice = totalTransactionPrice;
  }

  AddTransactionData.fromJson(dynamic json) {
    _transactionId = json['transaction_id'];
    _totalTransactionPrice = json['total_transaction_price'];
  }

  num? _transactionId;
  num? _totalTransactionPrice;

  AddTransactionData copyWith({
    num? transactionId,
    num? totalTransactionPrice,
  }) =>
      AddTransactionData(
        transactionId: transactionId ?? _transactionId,
        totalTransactionPrice: totalTransactionPrice ?? _totalTransactionPrice,
      );

  num? get transactionId => _transactionId;

  num? get totalTransactionPrice => _totalTransactionPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transaction_id'] = _transactionId;
    map['total_transaction_price'] = _totalTransactionPrice;
    return map;
  }
}
