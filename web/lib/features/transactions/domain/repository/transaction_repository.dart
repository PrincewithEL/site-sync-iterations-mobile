import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/transactions/domain/entity/add_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/delete_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

abstract interface class TransactionRepository {
  Future<Either<Failure, TransactionsResponseEntity>> getAllTransaction({
    required String projectId,
  });

  Future<Either<Failure, AddTransactionResponseEntity>> addTransaction({
    required String projectId,
    required String transactionName,
    required String transactionDetails,
    required double transactionPrice,
    required int transactionQuantity,
    required String transactionCategory,
    required String transactionType,
  });

  Future<Either<Failure, DeleteTransactionResponseEntity>> deleteTransaction({
    required String projectId,
    required String transactionId,
  });
}
