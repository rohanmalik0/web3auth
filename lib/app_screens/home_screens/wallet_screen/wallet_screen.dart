import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Routes.walletNavigator,
        onGenerateRoute: Routes.generateWalletRoutes,
      ),
    );
  }
}

class WalletScreenContents extends StatelessWidget {
  const WalletScreenContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(
          child: Text(
        "Wallet Feature Coming soon",
        style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
            fontFamily: AppStrings.regular),
      )),
    );
  }
}
