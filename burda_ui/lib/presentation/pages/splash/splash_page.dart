import 'package:burda_ui/bloc/splash/splash_notifier.dart';
import 'package:burda_ui/core/constants/paths.dart';
import 'package:burda_ui/core/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashNotifier>().checkUserLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color.fromARGB(255, 117, 133, 155), Colors.white],
      )),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconPath.logo,
            width: 50,
          ),
          sizedBoxH(12),
          const Text(
            "Loading...",
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      )),
    ));
  }
}
