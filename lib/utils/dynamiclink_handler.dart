import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/buisness_logic/HomeBottomNavigationBloc/home_bottom_navigator_bar_index_bloc.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeepLinkHandler {
  static final dynamicLinks = FirebaseDynamicLinks.instance;
  static String link = 'https://dextrlabstask.page.link/';

  static Future<void> initDynamicLink(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data != null) {
      Uri? deepLink = data.link;
      var isLink = deepLink.pathSegments.contains('home');
      if (isLink) {
        // ignore: use_build_context_synchronously
        _navigateToHome(context, deepLink.pathSegments[1]);
      }
    }

    dynamicLinks.onLink.listen((event) {
      final Uri deepLink = event.link;
      var isLink = deepLink.pathSegments.contains('home');
      if (isLink) {
        _navigateToHome(context, deepLink.pathSegments[1]);
      }
    });
  }

  static void _navigateToHome(BuildContext context, String skuId) {
    BlocProvider.of<HomeBottomNavigatorBarIndexBloc>(context)
        .add(ChangeHomeBottomNavigationIndex(0));
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Routes.homeNavigator.currentState!.pushNamed(
        Routes.portfolioScreen,
      );
    });
  }

  // static Future<String> createDynamicLink(bool short, String skuId) async {
  //   String linkMessage = "";

  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://culturecircle.page.link',
  //     link: Uri.parse(
  //         'https://www.culture-circle.com/products/$skuId?utm_source=productDetail'),
  //     androidParameters: const AndroidParameters(
  //       packageName: 'com.cc.culture_circle',
  //       minimumVersion: 0,
  //     ),
  //     iosParameters: const IOSParameters(
  //       bundleId: 'com.metacircles.cultureCircle',
  //       minimumVersion: '0',
  //     ),
  //   );

  //   if (short) {
  //     final ShortDynamicLink shortLink =
  //         await dynamicLinks.buildShortLink(parameters);
  //     linkMessage = shortLink.shortUrl.toString();
  //   } else {
  //     final Uri longLink = await dynamicLinks.buildLink(parameters);
  //     linkMessage = longLink.toString();
  //   }

  //   return linkMessage;
  // }
}
