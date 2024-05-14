import 'package:burda_ui/bloc/login/login_notifier.dart';
import 'package:burda_ui/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../components/custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LoginNotifier>().addListener(() {
      final loginState = context.read<LoginNotifier>().loginState;
      if (loginState is LoginSuccess) {
        context.goNamed("home");
      } else if (loginState is LoginFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Auth Error"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomField(
                controller: usernameController,
                hintText: 'Username',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (usernameController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty) {
                      context
                          .read<LoginNotifier>()
                          .loginUser(username: usernameController.text, password: passwordController.text);
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
