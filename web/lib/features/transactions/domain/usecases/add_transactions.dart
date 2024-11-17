import 'package:fpdart/fpdart.dart';
import 'package:site_sync/features/transactions/domain/entity/add_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/transaction_repository.dart';

class AddTransactionUseCase
    implements UseCase<AddTransactionResponseEntity, AddTransactionParams> {
  final TransactionRepository _transactionRepository;

  AddTransactionUseCase(this._transactionRepository);

  @override
  Future<Either<Failure, AddTransactionResponseEntity>> call(
      AddTransactionParams param) {
    return _transactionRepository.addTransaction(
      projectId: param.projectId,
      transactionName: param.transactionName,
      transactionDetails: param.transactionDetails,
      transactionPrice: param.transactionPrice,
      transactionQuantity: param.transactionQuantity,
      transactionCategory: param.transactionCategory,
      transactionType: param.transactionType,
    );
  }
}

class AddTransactionParams {
  final String projectId;
  final String transactionName;
  final String transactionDetails;
  final double transactionPrice;
  final int transactionQuantity;
  final String transactionCategory;
  final String transactionType;

  AddTransactionParams({
    required this.projectId,
    required this.transactionName,
    required this.transactionDetails,
    required this.transactionPrice,
    required this.transactionQuantity,
    required this.transactionCategory,
    required this.transactionType,
  });
}
