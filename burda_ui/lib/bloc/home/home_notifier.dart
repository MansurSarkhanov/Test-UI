import 'package:burda_ui/data/repository/home_repository.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class HomeNotifier extends ChangeNotifier {
  final _repository = HomeRepository();
  late UserModel currentUser;

  Future<void> fetchUserInfo() async {
    currentUser = await _repository.fetchUserInfo();
    notifyListeners();
  }

  void changeUserInfo(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}
