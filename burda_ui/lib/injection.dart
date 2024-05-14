import 'package:burda_ui/data/data_source/auth_data_source.dart';
import 'package:burda_ui/data/data_source/local/preferences_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/local/local_data_source.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  getIt.registerLazySingleton(() => AuthDataSource());

  getIt.registerLazySingleton(() => LocalAuthDataSource(secureStorage: const FlutterSecureStorage()));
  getIt.registerLazySingleton(() => PreferencesDataSource());
}
