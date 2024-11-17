import 'package:site_sync/features/transactions/domain/entity/delete_transaction_response_entity.dart';

class DeleteTransactionResponseModel extends DeleteTransactionResponseEntity {
  DeleteTransactionResponseModel({
    required super.statusCode,
    required super.message,
  });

  factory DeleteTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteTransactionResponseModel(
      message: json['message'],
      statusCode: json['status_code'],
    );
  }
}
