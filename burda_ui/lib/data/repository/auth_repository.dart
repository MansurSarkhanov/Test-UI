import 'package:burda_ui/data/data_source/auth_data_source.dart';

import '../../injection.dart';
import '../data_source/local/local_data_source.dart';

abstract interface class IAuthRepository {
  Future<bool> loginUser({required String username, required String password});
  Future<bool> checkAuth();
}

class AuthRepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();

  final _secureStorage = getIt.get<LocalAuthDataSource>();

  @override
  Future<bool> loginUser({required String username, required String password}) async {
    try {
      final response = await _authDataSource.loginUser(username: username, password: password);
      if (response == null) return false;
      await _secureStorage.saveToken("token", response);
      // await _preferences.setString('username', username);
      // await _preferences.setString('password', password);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await _secureStorage.token;
    if (token == null) return false;
    return true;
  }
}
