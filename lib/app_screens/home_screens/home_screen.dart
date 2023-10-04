import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/buisness_logic/HomeBottomNavigationBloc/home_bottom_navigator_bar_index_bloc.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreeContents extends StatelessWidget {
  const HomeScreeContents({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Routes.willPop(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Navigator(
              key: Routes.homeNavigator,
              onGenerateRoute: Routes.generateHomeRoutes,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5.h,
              child: BlocBuilder<HomeBottomNavigatorBarIndexBloc,
                  HomeBottomNavigatorBarIndexState>(
                builder: (context, state) {
                  return FloatingNavbar(
                    backgroundColor: appNavBarColor,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    itemBorderRadius: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 6.w,
                    ),
                    selectedItemColor: Color(0xFF6163c9),
                    borderRadius: 40,
                    onTap: (val) {
                      Routes.updateHomeBottomNavigation(val);

                      BlocProvider.of<HomeBottomNavigatorBarIndexBloc>(context)
                          .add(ChangeHomeBottomNavigationIndex(val));
                    },
                    currentIndex: Routes.selectHomeIndex,
                    items: [
                      FloatingNavbarItem(
                        icon: Icons.bar_chart_rounded,
                      ),
                      FloatingNavbarItem(
                        icon: Icons.wallet_rounded,
                      ),
                      FloatingNavbarItem(
                        icon: Icons.swap_horiz_rounded,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
