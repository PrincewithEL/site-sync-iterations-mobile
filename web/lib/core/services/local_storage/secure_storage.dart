import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/constants.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> setCredentials({
    required String userId,
    required String userType,
    required String username,
    required String password,
  }) async {
    await _storage.write(key: userIdKey, value: userId);
    await _storage.write(key: userTypeId, value: userType);
    await _storage.write(key: usernameKey, value: username);
    await _storage.write(key: passwordKey, value: password);
  }

  Future<String?> getCredentials(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> clearCredentials() async {
    await _storage.delete(key: userIdKey);
    await _storage.delete(key: usernameKey);
    await _storage.delete(key: passwordKey);
  }
}
