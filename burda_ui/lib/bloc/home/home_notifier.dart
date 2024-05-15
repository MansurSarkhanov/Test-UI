import 'package:burda_ui/data/data_source/local/local_data_source.dart';
import 'package:burda_ui/data/repository/home_repository.dart';
import 'package:burda_ui/injection.dart';
import 'package:burda_ui/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_source/local/preferences_source.dart';
import '../../models/user_model.dart';

class HomeNotifier extends ChangeNotifier {
  UserModel? currentUser;
  final _preferences = getIt.get<PreferencesDataSource>();
  final _repository = HomeRepository();
  final _secureStorage = getIt.get<LocalAuthDataSource>();
  List<ProductModel>? items;
  List<String>? categoryItem;
  String currentLancode = 'en';

  void changeLanguage(String lanCode) {
    currentLancode = lanCode;
    notifyListeners();
  }

  Future<void> fetchUserInfo() async {
    currentUser = await _repository.fetchUserInfo();
    notifyListeners();
  }

  Future<void> updateUser({required String username, required String password}) async {
    currentUser = UserModel(password: password, username: username);
    await _preferences.saveString('username', username);
    await _preferences.saveString('password', password);
    notifyListeners();
  }

  Future<void> readUser() async {
    final username = await _preferences.readString('username');
    final password = await _preferences.readString('password');
    currentUser = UserModel(password: password!, username: username!);
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    items = await _repository.fetchProductAll();
    categoryItem = await _repository.getAllCategory();
    notifyListeners();
  }

  Future<void> deleteAccount(BuildContext context) async {
    await _secureStorage.clearToken();
    context.goNamed('splash');
  }
}
