import 'package:site_sync/features/transactions/domain/entity/add_transaction_request_entity.dart';

class AddTransactionRequestModel extends AddTransactionRequestEntity {
  AddTransactionRequestModel({
    required super.transactionName,
    required super.transactionDetails,
    required super.transactionPrice,
    required super.transactionQuantity,
    required super.transactionCategory,
    required super.transactionType,
  });

  factory AddTransactionRequestModel.fromJson(Map<String, dynamic> json) {
    return AddTransactionRequestModel(
      transactionName: json['transaction_name'],
      transactionDetails: json['transaction_details'],
      transactionPrice: json['transaction_price'],
      transactionQuantity: json['transaction_quantity'],
      transactionCategory: json['transaction_category'],
      transactionType: json['transaction_type'],
    );
  }
}
