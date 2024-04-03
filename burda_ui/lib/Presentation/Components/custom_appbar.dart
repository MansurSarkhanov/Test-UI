import 'package:burda_ui/Core/Constants/paths.dart';
import 'package:burda_ui/Presentation/Animation/bounce_animation.dart';
import 'package:burda_ui/Provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      toolbarHeight: 170,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BounceFromBottomAnimation(
                delay: 2,
                isLeft: true,
                isVertical: false,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(context.watch<HomeProvider>().currenUser.imageUrl))),
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
              ),
              BounceFromBottomAnimation(
                delay: 2,
                isTop: true,
                child: Row(
                  children: [
                    SvgPicture.asset(IconPath.logo),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "burda",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              BounceFromBottomAnimation(isVertical: false, delay: 2, child: SvgPicture.asset(IconPath.notifi))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Gizli rejmi aktivlesdir",
                    style: TextStyle(color: Colors.black),
                  ),
                  CupertinoSwitch(
                      value: context.watch<HomeProvider>().isVisible,
                      onChanged: (value) {
                        context.read<HomeProvider>().changeVisible(value);
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}
