import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/auth_repository.dart';

class SplashNotifier extends ChangeNotifier {
  final _authRepository = AuthRepository();

  Future<void> checkUserLogin(BuildContext context) async {
    final result = await _authRepository.checkAuth();
    if (result) {
      context.goNamed("home");
    } else {
      context.goNamed("login");
    }
  }
}
