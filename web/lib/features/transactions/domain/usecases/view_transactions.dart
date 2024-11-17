import 'package:fpdart/fpdart.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/transaction_repository.dart';

class ViewTransactionUseCase
    implements UseCase<TransactionsResponseEntity, String> {
  final TransactionRepository _transactionRepository;

  ViewTransactionUseCase(this._transactionRepository);

  @override
  Future<Either<Failure, TransactionsResponseEntity>> call(String projectId) {
    return _transactionRepository.getAllTransaction(
      projectId: projectId,
    );
  }
}
