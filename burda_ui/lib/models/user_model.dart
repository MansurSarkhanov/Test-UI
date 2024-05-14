import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String password;

  const UserModel({required this.password, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [username, password];
}
