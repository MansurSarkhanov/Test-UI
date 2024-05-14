import 'package:burda_ui/data/data_source/local/preferences_source.dart';
import 'package:burda_ui/models/user_model.dart';

import '../../injection.dart';

abstract interface class IHomeRepository {
  Future<UserModel> fetchUserInfo();
}

class HomeRepository implements IHomeRepository {
  final _preferences = getIt.get<PreferencesDataSource>();
  @override
  Future<UserModel> fetchUserInfo() async {
    final username = await _preferences.readString('username');
    final password = await _preferences.readString('password');
    return UserModel(username: username!, password: password!);
  }
}
