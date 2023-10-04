import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:dextrlabstask/app_screens/home_screens/home_screen.dart';
import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/buisness_logic/HomeBottomNavigationBloc/home_bottom_navigator_bar_index_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class AuthenticationRepository {
  static VoidCallback login(
      Future<Web3AuthResponse> Function() method, BuildContext context) {
    return () async {
      try {
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (_) => const HomeScreeContents()));
        BlocProvider.of<HomeBottomNavigatorBarIndexBloc>(context)
            .add(ChangeHomeBottomNavigationIndex(0));
        Routes.updateHomeBottomNavigation(0);
        log("in method");
        final Web3AuthResponse response = await method();
        log(response.userInfo.toString());

        // _result = response.toString();
        // logoutVisible = true;
      } on UserCancelledException {
        debugPrint("User cancelled.");
      } on UnKnownException {
        debugPrint("Unknown exception occurred");
      }
    };
  }

// Initialization
  static Future<void> initPlatformState() async {
    final themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('https://dextrlabstask.page.link/home');
    } else if (Platform.isIOS) {
      redirectUrl = Uri.parse('https://dextrlabstask.page.link/home');
    } else {
      throw UnKnownException('Unknown platform');
    }
    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId:
          "BDFqunLk-dpWG654mtPHW5r0DpLwVv3yKfVg1rfG6uNVqyoxYNAr5O0vBJAhrniJDDSuYuNatmAJDVrLtyTalfE",
      network: Network.testnet,
      redirectUrl: redirectUrl,
    ));

    // Call initialize() function to get privKey and user information without relogging in user if a user has an active session
    await Web3AuthFlutter.initialize();

    // call getPrivKey() function to get user private key
    // ignore: unused_local_variable
    final String privKey = await Web3AuthFlutter.getPrivKey();

    // call getEd25519PrivKey() function to get user ed25519 private key
    // ignore: unused_local_variable
    final String ed255199PrivKey = await Web3AuthFlutter.getEd25519PrivKey();

    // call getUserInfo() function to get user information like name, email, verifier, verifierId etc.
    final TorusUserInfo userInfo = await Web3AuthFlutter.getUserInfo();
    log(userInfo.toString());
  }
}
