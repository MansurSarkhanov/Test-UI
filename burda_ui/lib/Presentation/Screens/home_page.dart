import 'package:burda_ui/Core/Constants/paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      toolbarHeight: 170,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
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
                  CupertinoSwitch(value: false, onChanged: (value) {})
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
