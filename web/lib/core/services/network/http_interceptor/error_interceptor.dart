import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle different error types
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
          // Handle bad request
            break;
          case 401:
          // Handle unauthorized
            break;
          case 403:
          // Handle forbidden
            break;
          case 404:
            debugPrint("Error response ${err.response}");
            break;
          case 500:
          // Handle server error
            break;
        }
        break;
      case DioExceptionType.cancel:
      // Handle request cancellation
        break;
      case DioExceptionType.unknown:
      // Handle unknown errors
        break;
      default:
      // Handle other errors
        break;
    }

    // Don't forget to call super or handler.next(err)
    handler.next(err);
  }
}
