import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/transactions/domain/entity/add_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/delete_transaction_response_entity.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';
import 'package:site_sync/features/transactions/domain/usecases/add_transactions.dart';
import 'package:site_sync/features/transactions/domain/usecases/delete_transactions.dart';
import 'package:site_sync/features/transactions/domain/usecases/view_transactions.dart';

part 'transactions_event.dart';

part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final AddTransactionUseCase _addTransactionUseCase;
  final ViewTransactionUseCase _viewTransactionUseCase;
  final DeleteTransactionUseCase _deleteTransactionUseCase;

  TransactionsBloc(
      AddTransactionUseCase addTransactionUseCase,
      ViewTransactionUseCase viewTransactionUseCase,
      DeleteTransactionUseCase deleteTransactionUseCase)
      : _addTransactionUseCase = addTransactionUseCase,
        _viewTransactionUseCase = viewTransactionUseCase,
        _deleteTransactionUseCase = deleteTransactionUseCase,
        super(TransactionsInitial()) {
    on<AddTransaction>(_onAddTransaction);
    on<ViewTransaction>(_onViewTransactions);
    on<DeleteTransaction>(_onDeleteTransactions);
  }

  void _onViewTransactions(
    final ViewTransaction event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(ViewTransactionLoading());
    final response = await _viewTransactionUseCase(
      event.projectId,
    );
    response.fold(
      (failure) => emit(
        ViewTransactionFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        ViewTransactionSuccess(
          response: response,
        ),
      ),
    );
  }

  void _onDeleteTransactions(
    final DeleteTransaction event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(DeleteTransactionLoading());
    final response = await _deleteTransactionUseCase(DeleteTransactionParams(
      projectId: event.projectId,
      transactionId: event.transactionId,
    ));
    response.fold(
      (failure) => emit(
        DeleteTransactionFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        DeleteTransactionSuccess(
          response: response,
        ),
      ),
    );
  }

  void _onAddTransaction(
    final AddTransaction event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(AddTransactionLoading());
    final response = await _addTransactionUseCase(AddTransactionParams(
      projectId: event.projectId,
      transactionName: event.transactionName,
      transactionDetails: event.transactionDetails,
      transactionPrice: event.transactionPrice,
      transactionQuantity: event.transactionQuantity,
      transactionCategory: event.transactionCategory,
      transactionType: event.transactionType,
    ));
    response.fold(
      (failure) => emit(
        AddTransactionFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        AddTransactionSuccess(
          response: response,
        ),
      ),
    );
  }
}
