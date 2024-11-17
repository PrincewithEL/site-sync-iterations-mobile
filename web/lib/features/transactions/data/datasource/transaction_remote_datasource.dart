import 'package:dio/dio.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/features/transactions/data/model/add_transaction_request_model.dart';
import 'package:site_sync/features/transactions/data/model/add_transaction_response_model.dart';
import 'package:site_sync/features/transactions/data/model/delete_transaction_response_model.dart';
import 'package:site_sync/features/transactions/data/model/transaction_response_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';
import '../../../../core/services/network/end_points.dart';
import '../../../../core/utils/utils.dart';

abstract interface class TransactionRemoteDatasource {
  Future<TransactionResponseModel> getAllTransaction({
    required String projectId,
  });

  Future<AddTransactionResponseModel> addTransaction({
    required String projectId,
    required String transactionName,
    required String transactionDetails,
    required double transactionPrice,
    required int transactionQuantity,
    required String transactionCategory,
    required String transactionType,
  });

  Future<DeleteTransactionResponseModel> deleteTransaction({
    required String projectId,
    required String transactionId,
  });
}

class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  final ApiService apiService;

  TransactionRemoteDatasourceImpl(
    this.apiService,
  );

  @override
  Future<TransactionResponseModel> getAllTransaction({
    required String projectId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.viewAllTransaction.url, {
        "projectId": projectId,
      });
      final response = await apiService.getRequest(
        url: url,
      );
      return TransactionResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<AddTransactionResponseModel> addTransaction({
    required String projectId,
    required String transactionName,
    required String transactionDetails,
    required double transactionPrice,
    required int transactionQuantity,
    required String transactionCategory,
    required String transactionType,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.addTransaction.url, {
        "projectId": projectId,
      });
      final response = await apiService.postRequest(
        payload: AddTransactionRequestModel(
          transactionName: transactionName,
          transactionDetails: transactionDetails,
          transactionPrice: transactionPrice,
          transactionQuantity: transactionQuantity,
          transactionCategory: transactionCategory,
          transactionType: transactionType,
        ).toJson(),
        url: url,
      );
      return AddTransactionResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<DeleteTransactionResponseModel> deleteTransaction({
    required String projectId,
    required String transactionId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.deleteTransaction.url, {
        "projectId": projectId,
        "transactionId": transactionId,
      });
      final response = await apiService.deleteRequest(
        payload: {},
        url: url,
      );
      return DeleteTransactionResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
