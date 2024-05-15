import 'package:burda_ui/bloc/home/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeNotifier>().readUser();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Consumer<HomeNotifier>(
            builder: (context, notifier, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Card(
                  child: ListTile(
                    title: Text(notifier.currentUser?.username ?? "Test"),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: TextField(
                                controller: _usernameController,
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.change_circle_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Card(
                  child: ListTile(
                    title: Text(notifier.currentUser?.password ?? "******"),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: TextField(
                                controller: _passwordController,
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.change_circle_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_usernameController.text.trim().isNotEmpty && _passwordController.text.trim().isNotEmpty) {
                        notifier.updateUser(username: _usernameController.text, password: _passwordController.text);
                      }
                    },
                    child: Text(localization.save)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      notifier.deleteAccount(context);
                    },
                    child: Center(child: Text(localization.delete))),
                const Spacer(),
                Text(localization.language),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        notifier.changeLanguage('en');
                      },
                      child: const Text('English'),
                    ),
                    TextButton(
                      onPressed: () {
                        notifier.changeLanguage('az');
                      },
                      child: const Text('Azerbaijan'),
                    ),
                    TextButton(
                      onPressed: () {
                        notifier.changeLanguage('tr');
                      },
                      child: const Text('Turkhis'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
