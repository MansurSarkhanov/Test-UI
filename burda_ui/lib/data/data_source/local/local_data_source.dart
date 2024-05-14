import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class ILocalAuthDataSource {
  Future<void> saveToken(String value, String key);
  Future<String?> get token;
  Future<void> clearToken();
}

class LocalAuthDataSource implements ILocalAuthDataSource {
  final FlutterSecureStorage secureStorage;

  LocalAuthDataSource({required this.secureStorage});

  @override
  Future<void> saveToken(String key, String value) async {
    try {
      final token = value;
      await secureStorage.write(key: key, value: token);
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }

  @override
  Future<String?> get token async {
    try {
      final token = await secureStorage.read(key: 'token');
      return token;
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await secureStorage.delete(key: 'token');
    } catch (e, s) {
      Error.throwWithStackTrace(e, s);
    }
  }
}
