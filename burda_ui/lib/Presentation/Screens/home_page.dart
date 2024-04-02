import 'package:burda_ui/Core/Constants/paths.dart';
import 'package:burda_ui/Presentation/Components/Sheets/user_sheets.dart';
import 'package:burda_ui/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Components/custom_appbar.dart';
import '../Components/custom_navbar.dart';

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
    return Consumer<HomeProvider>(builder: (context, provider, ___) {
      return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomNavBar(),
        body: _homeBody(provider),
      );
    });
  }

  Widget _homeBody(HomeProvider provider) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: provider.users.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            showSheet(context, provider, index);
          },
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              provider.users[index].imageUrl,
                            ))),
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
              title: Text(
                provider.users[index].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(provider.users[index].pleace),
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
