import 'package:site_sync/core/error/site_sync_error.dart';

class ServerException implements Exception {
  final SiteSyncError error;

  const ServerException({required this.error});
}