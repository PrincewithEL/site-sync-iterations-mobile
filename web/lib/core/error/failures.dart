import 'package:site_sync/core/error/site_sync_error.dart';

class Failure {
  final SiteSyncError siteSyncError;

  const Failure({required this.siteSyncError});
}
