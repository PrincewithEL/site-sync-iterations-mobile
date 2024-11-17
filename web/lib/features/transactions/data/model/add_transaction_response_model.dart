import 'package:site_sync/features/transactions/domain/entity/add_transaction_response_entity.dart';

class AddTransactionResponseModel extends AddTransactionResponseEntity {
  AddTransactionResponseModel({
    required super.message,
    required super.statusCode,
    required super.data,
  });

  factory AddTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return AddTransactionResponseModel(
      message: json['message'],
      statusCode: json['status_code'],
      data: json['data'] != null
          ? AddTransactionDataModel.fromJson(json['data'])
          : null,
    );
  }
}

class AddTransactionDataModel extends AddTransactionData {
  AddTransactionDataModel({
    required super.transactionId,
    required super.totalTransactionPrice,
  });

  factory AddTransactionDataModel.fromJson(Map<String, dynamic> json) {
    return AddTransactionDataModel(
      transactionId: json['transaction_id'],
      totalTransactionPrice: json['total_transaction_price'],
    );
  }
}
