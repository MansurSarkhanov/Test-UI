import 'package:burda_ui/Core/Constants/paths.dart';
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
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(context.watch<HomeProvider>().currenUser.imageUrl))),
               
              ),
              Row(
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
              SvgPicture.asset(IconPath.notifi)
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
