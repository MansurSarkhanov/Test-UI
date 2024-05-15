import 'package:burda_ui/data/data_source/home_data_source.dart';
import 'package:burda_ui/data/data_source/local/preferences_source.dart';
import 'package:burda_ui/models/product_model.dart';
import 'package:burda_ui/models/user_model.dart';

import '../../injection.dart';

abstract interface class IHomeRepository {
  Future<UserModel> fetchUserInfo();
  Future<List<ProductModel>?> fetchProductAll();
  Future<List<String>?> getAllCategory();
}

class HomeRepository implements IHomeRepository {
  final _preferences = getIt.get<PreferencesDataSource>();
  final _homeDataSource = getIt.get<HomeDataSource>();

  @override
  Future<UserModel> fetchUserInfo() async {
    final username = await _preferences.readString('username');
    final password = await _preferences.readString('password');
    return UserModel(username: username!, password: password!);
  }

  @override
  Future<List<ProductModel>?> fetchProductAll() async {
    try {
      final result = await _homeDataSource.fetchProductAll();
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>?> getAllCategory() async {
    try {
      final result = await _homeDataSource.getAllCategory();
      return result;
    } catch (e) {
      return null;
    }
  }
}
