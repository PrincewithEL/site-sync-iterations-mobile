part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsEvent {}

final class AddTransaction extends TransactionsEvent {
  final String projectId;
  final String transactionName;
  final String transactionDetails;
  final double transactionPrice;
  final int transactionQuantity;
  final String transactionCategory;
  final String transactionType;

  AddTransaction({
    required this.projectId,
    required this.transactionName,
    required this.transactionDetails,
    required this.transactionPrice,
    required this.transactionQuantity,
    required this.transactionCategory,
    required this.transactionType,
  });
}

final class ViewTransaction extends TransactionsEvent {
  final String projectId;

  ViewTransaction({
    required this.projectId,
  });
}

final class DeleteTransaction extends TransactionsEvent {
  final String projectId;
  final String transactionId;

  DeleteTransaction({
    required this.projectId,
    required this.transactionId,
  });
}
