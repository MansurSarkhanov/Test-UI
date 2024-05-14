import 'package:burda_ui/bloc/login/login_notifier.dart';
import 'package:burda_ui/presentation/pages/home/home_page.dart';
import 'package:burda_ui/presentation/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'bloc/home/home_notifier.dart';
import 'bloc/splash/splash_notifier.dart';
import 'presentation/pages/login/login_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => SplashNotifier(),
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => LoginNotifier(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => ChangeNotifierProvider(
              create: (context) => HomeNotifier(),
              child: const HomePage(),
            ),
        routes: [
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => ChangeNotifierProvider(
              create: (context) => HomeNotifier(),
              child: const HomePage(),
            ),
          ),
        ])
  ],
);
