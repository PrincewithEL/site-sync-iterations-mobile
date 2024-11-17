import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'end_points.dart';

class DioClient {
  final String baseUrl = Url.baseUrl;

  DioClient();

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120));
    Dio dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      ]);
    }

    return dio;
  }
}
