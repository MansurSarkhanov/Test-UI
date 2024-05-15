import 'package:burda_ui/bloc/home/home_notifier.dart';
import 'package:burda_ui/presentation/animation/bounce_animation.dart';
import 'package:burda_ui/presentation/pages/home/view/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    context.read<HomeNotifier>().fetchUserInfo();
    context.read<HomeNotifier>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Consumer<HomeNotifier>(builder: (context, provider, ___) {
      return Scaffold(
        appBar: AppBar(
          title: Text(localization.home),
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
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: provider.categoryItem?.map((e) => Chip(label: Text(e.toString()))).toList() ?? [],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 9 / 16),
            padding: const EdgeInsets.all(12),
            itemCount: provider.items?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomeDetail(data: provider.items![index]);
                    },
                  ));
                },
                child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image.network(
                          provider.items?[index].image ?? 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                          width: 50,
                          height: 50,
                        ),
                        Text(provider.items?[index].title ?? 'title'),
                        Text(provider.items?[index].price.toString() ?? '0.0'),
                      ]),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
