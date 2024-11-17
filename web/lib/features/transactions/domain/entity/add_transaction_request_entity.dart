/// transaction_name : "Office Supplies"
/// transaction_details : "Purchased pens, paper, and notebooks."
/// transaction_price : 2.50
/// transaction_quantity : 10
/// transaction_category : "Office Supplies"
/// transaction_type : "Expense"

class AddTransactionRequestEntity {
  AddTransactionRequestEntity({
      String? transactionName, 
      String? transactionDetails, 
      num? transactionPrice, 
      num? transactionQuantity, 
      String? transactionCategory, 
      String? transactionType,}){
    _transactionName = transactionName;
    _transactionDetails = transactionDetails;
    _transactionPrice = transactionPrice;
    _transactionQuantity = transactionQuantity;
    _transactionCategory = transactionCategory;
    _transactionType = transactionType;
}

  AddTransactionRequestEntity.fromJson(dynamic json) {
    _transactionName = json['transaction_name'];
    _transactionDetails = json['transaction_details'];
    _transactionPrice = json['transaction_price'];
    _transactionQuantity = json['transaction_quantity'];
    _transactionCategory = json['transaction_category'];
    _transactionType = json['transaction_type'];
  }
  String? _transactionName;
  String? _transactionDetails;
  num? _transactionPrice;
  num? _transactionQuantity;
  String? _transactionCategory;
  String? _transactionType;
AddTransactionRequestEntity copyWith({  String? transactionName,
  String? transactionDetails,
  num? transactionPrice,
  num? transactionQuantity,
  String? transactionCategory,
  String? transactionType,
}) => AddTransactionRequestEntity(  transactionName: transactionName ?? _transactionName,
  transactionDetails: transactionDetails ?? _transactionDetails,
  transactionPrice: transactionPrice ?? _transactionPrice,
  transactionQuantity: transactionQuantity ?? _transactionQuantity,
  transactionCategory: transactionCategory ?? _transactionCategory,
  transactionType: transactionType ?? _transactionType,
);
  String? get transactionName => _transactionName;
  String? get transactionDetails => _transactionDetails;
  num? get transactionPrice => _transactionPrice;
  num? get transactionQuantity => _transactionQuantity;
  String? get transactionCategory => _transactionCategory;
  String? get transactionType => _transactionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transaction_name'] = _transactionName;
    map['transaction_details'] = _transactionDetails;
    map['transaction_price'] = _transactionPrice;
    map['transaction_quantity'] = _transactionQuantity;
    map['transaction_category'] = _transactionCategory;
    map['transaction_type'] = _transactionType;
    return map;
  }

}