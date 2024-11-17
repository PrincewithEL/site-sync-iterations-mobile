class ApiResponse<T> {
  final T? data;
  final int? statusCode;
  final String? error;
  final bool isSuccess;

  ApiResponse({
    this.data,
    this.statusCode,
    this.error,
    this.isSuccess = false
  });
}