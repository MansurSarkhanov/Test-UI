import 'package:shared_preferences/shared_preferences.dart';

abstract class IPreferencesDataSource {
  Future<void> saveString(String key, String value);
  Future<String?> readString(String key);
  Future<void> deleteData(String key);
}

class PreferencesDataSource implements IPreferencesDataSource {
  @override
  Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<String?> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
