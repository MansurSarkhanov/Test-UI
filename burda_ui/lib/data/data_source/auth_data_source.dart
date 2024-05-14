import 'package:burda_ui/models/user_model.dart';
import 'package:dio/dio.dart';

final class AuthDataSource {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
  );

  Future<String?> loginUser({required String username, required String password}) async {
    final user = UserModel(username: username, password: password).toJson();
    final request = await dio.post('/auth/login?', data: user);
    if (request.statusCode == 200) {
      final token = request.data['token'] as String;
      return token;
    }
    return null;
  }
}
