import 'package:burda_ui/bloc/home/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Consumer<HomeNotifier>(
            builder: (context, notifier, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(notifier.currentUser.username),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const TextField(),
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
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(notifier.currentUser.password),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const TextField(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
