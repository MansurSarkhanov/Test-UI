import 'package:burda_ui/bloc/home/home_notifier.dart';
import 'package:burda_ui/core/constants/paths.dart';
import 'package:burda_ui/presentation/animation/bounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, provider, ___) {
      return Scaffold(
        appBar: AppBar(
          title: Consumer<HomeNotifier>(
            builder: (context, notifier, child) => Text(notifier.currentUser.username),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.goNamed('settings');
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFF2F2F2),
        body: BounceFromBottomAnimation(delay: 2, child: _homeBody(provider)),
      );
    });
  }

  Widget _homeBody(HomeNotifier provider) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.all(12),
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              title: const Text(
                'sdfs',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('sdfsdf'),
              trailing: SvgPicture.asset(
                IconPath.chat,
                width: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
