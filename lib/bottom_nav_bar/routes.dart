import 'package:dextrlabstask/app_screens/auth_screens/login_screen.dart';
import 'package:dextrlabstask/app_screens/auth_screens/welcome_screen.dart';
import 'package:dextrlabstask/app_screens/home_screens/home_screen.dart';
import 'package:dextrlabstask/app_screens/home_screens/portfolio_screen/portfolio_screen.dart';
import 'package:dextrlabstask/app_screens/home_screens/swap_screen/swap_screen.dart';
import 'package:dextrlabstask/app_screens/home_screens/wallet_screen/wallet_screen.dart';
import 'package:dextrlabstask/bottom_nav_bar/exit_app_modal.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static int selectHomeIndex = 0;
  //Auth Screens
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String signup = "/signup";

  // Home Screens
  static const String portfolioScreen = "/porfolioScreen";
  static const String swapScreen = "/swapScreen";
  static const String walletScreen = "/addScreen";

  static final welcomeNavigator =
      GlobalKey<NavigatorState>(debugLabel: "mainNav");
  static final homeNavigator = GlobalKey<NavigatorState>(debugLabel: "homeNav");
  static final portfolioNavigator =
      GlobalKey<NavigatorState>(debugLabel: "portfolioNav");
  static final swapNavigator = GlobalKey<NavigatorState>(debugLabel: "swapNav");
  static final walletNavigator =
      GlobalKey<NavigatorState>(debugLabel: "addNav");

  static Route<dynamic> generateWelcomRoutes(RouteSettings settings) {
    if (settings.name == login) {
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    return MaterialPageRoute(
        builder: (context) => const WelcomScreenContents());
  }

  static Route<dynamic> generateHomeRoutes(RouteSettings settings) {
    if (settings.name == portfolioScreen) {
      return MaterialPageRoute(builder: (context) => const PortfolioScreen());
    }
    if (settings.name == walletScreen) {
      return MaterialPageRoute(builder: (context) => const WalletScreen());
    }
    if (settings.name == swapScreen) {
      return MaterialPageRoute(builder: (context) => const SwapScreen());
    }
    return MaterialPageRoute(builder: (context) => const PortfolioScreen());
  }

  static Route<dynamic> generatePortfolioRoutes(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => const PortfolioScreenContents());
  }

  static Route<dynamic> generateSwapRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const SwapScreenContents());
  }

  static Route<dynamic> generateWalletRoutes(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => const WalletScreenContents());
  }

  static Future<bool> willWelcomePop(
    BuildContext context, {
    bool isRoot = false,
  }) async {
    if (isRoot) {
      showDialog(
        context: context,
        builder: (context) {
          return const ExitAppModal();
        },
      );
    }

    if (Routes.welcomeNavigator.currentState!.canPop()) {
      Routes.welcomeNavigator.currentState!.pop();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ExitAppModal();
          });
    }

    return Future.value(false);
  }

  static Future<bool> willPop(
    BuildContext context, {
    bool isRoot = false,
  }) async {
    if (isRoot) {
      showDialog(
        context: context,
        builder: (context) {
          return const ExitAppModal();
        },
      );
    }
    switch (selectHomeIndex) {
      case 0:
        {
          if (Routes.portfolioNavigator.currentState!.canPop()) {
            Routes.portfolioNavigator.currentState!.pop();
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return const ExitAppModal();
                });
          }
          break;
        }
      case 1:
        {
          if (Routes.walletNavigator.currentState!.canPop()) {
            Routes.walletNavigator.currentState!.pop();
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return const ExitAppModal();
                });
          }
        }
      case 2:
        {
          if (Routes.swapNavigator.currentState!.canPop()) {
            Routes.swapNavigator.currentState!.pop();
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return const ExitAppModal();
                });
          }
        }
        break;
      default:
    }
    return Future.value(false);
  }

  static updateHomeBottomNavigation(index) async {
    switch (index) {
      case 0:
        if (Routes.selectHomeIndex == 0) {
        } else {
          Routes.homeNavigator.currentState!
              .pushReplacementNamed(Routes.portfolioScreen);
        }
        break;
      case 1:
        if (Routes.selectHomeIndex == 1) {
        } else {
          Routes.homeNavigator.currentState!
              .pushReplacementNamed(Routes.walletScreen);
        }
        break;
      case 2:
        if (Routes.selectHomeIndex == 2) {
        } else {
          Routes.homeNavigator.currentState!
              .pushReplacementNamed(Routes.swapScreen);
        }
        break;
    }
    Routes.selectHomeIndex = index;
  }
}
