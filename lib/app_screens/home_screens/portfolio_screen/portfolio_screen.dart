import 'package:dextrlabstask/app_screens/home_screens/portfolio_screen/widgets/gainer_card.dart';
import 'package:dextrlabstask/app_screens/home_screens/portfolio_screen/widgets/news_widget.dart';
import 'package:dextrlabstask/app_screens/home_screens/portfolio_screen/widgets/overview_widget.dart';
import 'package:dextrlabstask/app_screens/home_screens/portfolio_screen/widgets/watchlist_widget.dart';
import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/buisness_logic/PortfolioBloc/portfolio_bloc.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_images.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Routes.portfolioNavigator,
        onGenerateRoute: Routes.generatePortfolioRoutes,
      ),
    );
  }
}

class PortfolioScreenContents extends StatelessWidget {
  const PortfolioScreenContents({super.key});

  static List<Widget> portfolioTab = [
    const OverViewWidget(),
    const NewsWidget(),
    const WatchlistWidget()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(AppImages.profilePhoto))),
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Anna!",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: appTextColor,
                            fontFamily: AppStrings.regular),
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: appGreyColor,
                            fontFamily: AppStrings.regular),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.settings,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Markets",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
              SizedBox(
                height: 2.h,
              ),
              // CupertinoTabView(
              //   builder: (context) {
              //     return Container();
              //   },
              // ),
              BlocBuilder<PortfolioBloc, PortfolioState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border:
                                Border.all(width: 0.5, color: appGreyColor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<PortfolioBloc>(context)
                                      .add(const PortfolioIndexChangeEvent(0));
                                },
                                child: Container(
                                  width: 30.w,
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          PortfolioBloc.portfolioTabIndex == 0
                                              ? Colors.white
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    "Overview",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            PortfolioBloc.portfolioTabIndex == 0
                                                ? Colors.black
                                                : Colors.white,
                                        fontFamily: AppStrings.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<PortfolioBloc>(context)
                                      .add(const PortfolioIndexChangeEvent(1));
                                },
                                child: Container(
                                  width: 29.5.w,
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          PortfolioBloc.portfolioTabIndex == 1
                                              ? Colors.white
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    "News",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            PortfolioBloc.portfolioTabIndex == 1
                                                ? Colors.black
                                                : Colors.white,
                                        fontFamily: AppStrings.regular),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<PortfolioBloc>(context)
                                      .add(const PortfolioIndexChangeEvent(2));
                                },
                                child: Container(
                                  width: 30.w,
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          PortfolioBloc.portfolioTabIndex == 2
                                              ? Colors.white
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    "Watchlists",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            PortfolioBloc.portfolioTabIndex == 2
                                                ? Colors.black
                                                : Colors.white,
                                        fontFamily: AppStrings.regular),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      portfolioTab[PortfolioBloc.portfolioTabIndex]
                    ],
                  );
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 4.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: appTextColor,
                    ),
                    child: Icon(
                      Icons.line_axis_rounded,
                      size: 16.sp,
                      color: appPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Top Gainers",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: appTextColor,
                        fontFamily: AppStrings.regular),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See more",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 8.sp,
                            color: appGreyColor,
                            fontFamily: AppStrings.regular),
                      )),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: const GainerCard(),
                    );
                  })
            ],
          ),
        ));
  }
}
