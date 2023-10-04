import 'dart:developer';
import 'package:dextrlabstask/app_screens/auth_screens/widgets/header.dart';
import 'package:dextrlabstask/app_screens/home_screens/home_screen.dart';
import 'package:dextrlabstask/app_screens/widgets/custom_button.dart';
import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/buisness_logic/HomeBottomNavigationBloc/home_bottom_navigator_bar_index_bloc.dart';
import 'package:dextrlabstask/constants/app_background.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_images.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:dextrlabstask/data/Repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;

  bool logoutVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(gradient: backgroundGradient),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: ListView(children: [
                const AppHeader(),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: appTextColor,
                        fontFamily: AppStrings.bold),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: AuthenticationRepository.login(
                            _withGoogle, context),
                        child: Image.asset(
                          AppImages.googleIcon,
                          height: 4.h,
                          width: 4.h,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          log("here");
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreeContents()));
                          BlocProvider.of<HomeBottomNavigatorBarIndexBloc>(
                                  context)
                              .add(ChangeHomeBottomNavigationIndex(0));
                          Routes.updateHomeBottomNavigation(0);
                          // ignore: unused_local_variable
                          final Web3AuthResponse response =
                              await Web3AuthFlutter.login(LoginParams(
                                  loginProvider: Provider.facebook));
                        },
                        child: Image.asset(
                          AppImages.facebookIcon,
                          height: 4.h,
                          width: 4.h,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 4.h,
                          width: 4.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.more_horiz,
                            color: appPrimaryColor,
                            size: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                CustomButton(
                  buttonName: "LOGIN",
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (_) => const HomeScreeContents()));
                    BlocProvider.of<HomeBottomNavigatorBarIndexBloc>(context)
                        .add(ChangeHomeBottomNavigationIndex(0));
                    Routes.updateHomeBottomNavigation(0);
                  },
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T  HAVE AN ACCOUNT",
                      style: TextStyle(
                          color: appTextColor,
                          fontSize: 8.sp,
                          fontFamily: AppStrings.bold),
                    ),
                    TextButton(
                      child: const Text(
                        "Register",
                        style: TextStyle(color: appPrimaryColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signup);
                      },
                    )
                  ],
                ),
              ]),
            )));
  }

  static Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
    ));
  }
}
