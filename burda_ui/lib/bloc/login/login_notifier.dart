import 'package:burda_ui/bloc/login/login_state.dart';
import 'package:burda_ui/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  final _authRepository = AuthRepository();
  LoginState loginState = LoginInitial();

  Future<void> loginUser({required String username, required String password}) async {
    final result = await _authRepository.loginUser(username: username, password: password);
    if (result) {
      loginState = LoginSuccess();
      notifyListeners();
    } else {
      loginState = LoginFailed();
      notifyListeners();
    }
  }
}
