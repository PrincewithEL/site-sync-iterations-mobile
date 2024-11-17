part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class AddTransactionLoading extends TransactionsState {}

final class AddTransactionSuccess extends TransactionsState {
  final AddTransactionResponseEntity response;

  AddTransactionSuccess({required this.response});
}

final class AddTransactionFailure extends TransactionsState {
  final String message;

  AddTransactionFailure({required this.message});
}


final class ViewTransactionLoading extends TransactionsState {}

final class ViewTransactionSuccess extends TransactionsState {
  final TransactionsResponseEntity response;

  ViewTransactionSuccess({required this.response});
}

final class ViewTransactionFailure extends TransactionsState {
  final String message;

  ViewTransactionFailure({required this.message});
}


final class DeleteTransactionLoading extends TransactionsState {}

final class DeleteTransactionSuccess extends TransactionsState {
  final DeleteTransactionResponseEntity response;

  DeleteTransactionSuccess({required this.response});
}

final class DeleteTransactionFailure extends TransactionsState {
  final String message;

  DeleteTransactionFailure({required this.message});
}
