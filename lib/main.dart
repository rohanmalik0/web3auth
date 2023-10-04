import 'package:dextrlabstask/app_screens/auth_screens/login_screen.dart';
import 'package:dextrlabstask/app_screens/auth_screens/welcome_screen.dart';
import 'package:dextrlabstask/app_screens/home_screens/home_screen.dart';
import 'package:dextrlabstask/buisness_logic/HomeBottomNavigationBloc/home_bottom_navigator_bar_index_bloc.dart';
import 'package:dextrlabstask/buisness_logic/PortfolioBloc/portfolio_bloc.dart';
import 'package:dextrlabstask/data/Repository/authentication_repository.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  Firebase.initializeApp();
  AuthenticationRepository.initPlatformState();
  runApp(const MyApp());
}

GoRouter _appRoute = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (BuildContext context, GoRouterState state) {
      return const WelcomeScreen();
    },
  ),
  GoRoute(
    path: "/auth",
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    path: "/home",
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreeContents();
    },
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBottomNavigatorBarIndexBloc>(
            create: (context) => HomeBottomNavigatorBarIndexBloc()),
        BlocProvider<PortfolioBloc>(create: (context) => PortfolioBloc()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRoute,
          );
        },
      ),
    );
  }
}
