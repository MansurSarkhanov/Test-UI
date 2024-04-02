import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Core/Constants/paths.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
      ],
    ));
  }
}
