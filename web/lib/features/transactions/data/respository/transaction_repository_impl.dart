import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/transactions/data/datasource/transaction_remote_datasource.dart';
import 'package:site_sync/features/transactions/domain/entity/add_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/delete_transaction_response_entity.dart';

import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource remoteDatasource;

  TransactionRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, AddTransactionResponseEntity>> addTransaction({
    required String projectId,
    required String transactionName,
    required String transactionDetails,
    required double transactionPrice,
    required int transactionQuantity,
    required String transactionCategory,
    required String transactionType,
  }) async {
    try {
      final response = await remoteDatasource.addTransaction(
        projectId: projectId,
        transactionName: transactionName,
        transactionDetails: transactionDetails,
        transactionPrice: transactionPrice,
        transactionQuantity: transactionQuantity,
        transactionCategory: transactionCategory,
        transactionType: transactionType,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, DeleteTransactionResponseEntity>> deleteTransaction({
    required String projectId,
    required String transactionId,
  }) async {
    try {
      final response = await remoteDatasource.deleteTransaction(
        projectId: projectId,
        transactionId: transactionId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, TransactionsResponseEntity>> getAllTransaction({
    required String projectId,
  }) async {
    try {
      final response = await remoteDatasource.getAllTransaction(
        projectId: projectId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
