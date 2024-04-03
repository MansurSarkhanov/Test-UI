import 'package:burda_ui/Core/Constants/paths.dart';
import 'package:burda_ui/Presentation/Screens/home_page.dart';
import 'package:burda_ui/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<HomeProvider>().checkSplash(),
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return const HomePage();
          }
          return Container(
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
                const Text(
                  "Loading...",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
