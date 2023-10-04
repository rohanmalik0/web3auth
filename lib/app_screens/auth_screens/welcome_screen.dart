import 'package:dextrlabstask/app_screens/auth_screens/widgets/header.dart';
import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/constants/app_background.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:dextrlabstask/utils/dynamiclink_handler.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Routes.willWelcomePop(context),
      child: Scaffold(
        body: Navigator(
          key: Routes.welcomeNavigator,
          onGenerateRoute: Routes.generateWelcomRoutes,
        ),
      ),
    );
  }
}

class WelcomScreenContents extends StatefulWidget {
  const WelcomScreenContents({super.key});

  @override
  State<WelcomScreenContents> createState() => _WelcomScreenContentsState();
}

class _WelcomScreenContentsState extends State<WelcomScreenContents> {
  @override
  void initState() {
    DeepLinkHandler.initDynamicLink(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: ListView(
              children: [
                const AppHeader(),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Earn borrow \n& trade digital assets securely",
                  style: TextStyle(
                      color: appTextColor,
                      fontSize: 40.sp,
                      fontFamily: AppStrings.regular),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 19.h,
                    width: 19.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 17.h,
                        width: 17.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Get started",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: AppStrings.bold,
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_right_alt_rounded,
                              color: Colors.black,
                              size: 24.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
