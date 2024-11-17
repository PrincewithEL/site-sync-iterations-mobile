import 'package:fpdart/fpdart.dart';
import 'package:site_sync/features/transactions/domain/entity/delete_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/transaction_repository.dart';

class DeleteTransactionUseCase
    implements
        UseCase<DeleteTransactionResponseEntity, DeleteTransactionParams> {
  final TransactionRepository _transactionRepository;

  DeleteTransactionUseCase(this._transactionRepository);

  @override
  Future<Either<Failure, DeleteTransactionResponseEntity>> call(
      DeleteTransactionParams param) {
    return _transactionRepository.deleteTransaction(
      projectId: param.projectId,
      transactionId: param.transactionId,
    );
  }
}

class DeleteTransactionParams {
  final String projectId;
  final String transactionId;

  DeleteTransactionParams({
    required this.projectId,
    required this.transactionId,
  });
}
