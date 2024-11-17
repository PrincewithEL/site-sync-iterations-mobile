import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:site_sync/core/error/exceptions.dart';
import 'package:site_sync/core/error/site_sync_error.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'dio_client.dart';

class ApiService {
  final Dio _dio = DioClient().dio;

  ApiService();

  Future<Options> _withBasicAuth({Options? options}) async {
    final username = await SecureStorage().getCredentials(usernameKey);
    final password = await SecureStorage().getCredentials(passwordKey);

    if (username!.isEmpty || password!.isEmpty) {
      throw ServerException(
        error: SiteSyncError(
          statusCode: 403,
          message: 'Authentication credentials not found',
          data: {},
        ),
      );
    }

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final headersWithAuth = {
      ...options?.headers ?? {},
      'Authorization': basicAuth,
    };

    return Options(
      headers: headersWithAuth,
      method: options?.method,
      contentType: options?.contentType,
      responseType: options?.responseType,
      followRedirects: options?.followRedirects,
    );
  }

  Future<dynamic> postRequest({
    required final Map payload,
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    return await _dio.post(
      url,
      data: payload,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
  }

  Future<dynamic> postFormDataRequest({
    required final FormData payload,
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    return await _dio.post(
      url,
      data: payload,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
  }

  Future<dynamic> getRequest({
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    var response = _dio.get(
      url,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
    return response;
  }

  Future<dynamic> putRequest({
    required final Map payload,
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    return await _dio.put(
      url,
      data: payload,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
  }

  Future<dynamic> patchRequest({
    required final Map payload,
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    return await _dio.patch(
      url,
      data: payload,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
  }

  Future<dynamic> deleteRequest({
    required final Map payload,
    required final String url,
    final Options? options,
    final bool allowAuthOption = false,
  }) async {
    return await _dio.delete(
      url,
      data: payload,
      options: allowAuthOption ? await _withBasicAuth(options: options) : null,
    );
  }
}
