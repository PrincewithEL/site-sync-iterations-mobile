import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

class TransactionResponseModel extends TransactionsResponseEntity {
  TransactionResponseModel({
    required super.statusCode,
    required super.message,
    required super.data,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return TransactionResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((item) =>
                  TransactionDataModel.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class TransactionDataModel extends TransactionDataEntity {
  TransactionDataModel({
    required super.transactionId,
    required super.transactionName,
    required super.transactionDetails,
    required super.transactionPrice,
    required super.transactionQuantity,
    required super.transactionCategory,
    required super.transactionType,
    required super.totalTransactionPrice,
    required super.createdAt,
    required super.transactionDate,
    required super.transactionTime,
    required super.updatedAt,
    required super.transactionStatus,
    required super.isDeleted,
    required super.deletedAt,
    required super.user,
    required super.project,
    required super.task,
  });

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) {
    return TransactionDataModel(
      transactionId: json['transaction_id'] as num?,
      transactionName: json['transaction_name'] as String?,
      transactionDetails: json['transaction_details'] as String?,
      transactionPrice: json['transaction_price'] as num?,
      transactionQuantity: json['transaction_quantity'] as num?,
      transactionCategory: json['transaction_category'] as String?,
      transactionType: json['transaction_type'] as String?,
      totalTransactionPrice: json['total_transaction_price'] as num?,
      createdAt: json['created_at'] as String?,
      transactionDate: json['transaction_date'] as String?,
      transactionTime: json['transaction_time'] as String?,
      updatedAt: json['updated_at'],
      transactionStatus: json['transaction_status'] as String?,
      isDeleted: json['is_deleted'] as num?,
      deletedAt: json['deleted_at'],
      user: json['user'] as num?,
      project: json['project'] as num?,
      task: json['task'],
    );
  }
}
