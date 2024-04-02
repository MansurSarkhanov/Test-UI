import 'package:burda_ui/Core/Constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/custom_appbar.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar:
          TabBar(indicatorColor: Colors.transparent, labelColor: Colors.black, controller: controller, tabs: [
        Tab(
          text: 'Home',
          icon: SvgPicture.asset(IconPath.home),
        ),
        Tab(
          text: 'Search',
          icon: SvgPicture.asset(IconPath.search),
        ),
        Tab(
          text: 'Story',
          icon: SvgPicture.asset(IconPath.add),
        ),
        Tab(
          text: 'Discover',
          icon: SvgPicture.asset(IconPath.fire),
        ),
        Tab(
          text: 'Chat',
          icon: SvgPicture.asset(IconPath.chat),
        )
      ]),
      body: const Column(
        children: [],
      ),
    );
  }
}
