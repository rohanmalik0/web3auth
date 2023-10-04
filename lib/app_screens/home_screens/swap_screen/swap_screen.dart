import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_images.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Routes.swapNavigator,
        onGenerateRoute: Routes.generateSwapRoutes,
      ),
    );
  }
}

class SwapScreenContents extends StatefulWidget {
  const SwapScreenContents({super.key});

  @override
  State<SwapScreenContents> createState() => _SwapScreenContentsState();
}

class _SwapScreenContentsState extends State<SwapScreenContents>
    with TickerProviderStateMixin {
  double widgetATop = 0.h;
  double widgetBTop = 27.h;
  bool swapped = false;
  late AnimationController controller;
  late Animation<double> addressAnimation;
  TextEditingController btcController = TextEditingController();
  TextEditingController ethController = TextEditingController();
  animationListener() => setState(() {});
  @override
  void initState() {
    btcController.text = "1";

    super.initState();
  }

  void btctoethConvertor(String value, bool isBTC) {
    if (isBTC) {
      ethController.text =
          (double.parse(value) / 0.06).toStringAsFixed(2).toString();
    } else {
      btcController.text =
          (double.parse(value) * 0.06).toStringAsFixed(2).toString();
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // Initialize animations
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    addressAnimation = Tween(
      begin: 0.0,
      end: widgetBTop - widgetATop,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
    ))
      ..addListener(animationListener);
  }

  @override
  dispose() {
    // Dispose of animation controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tweenValue = addressAnimation.value;
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white.withOpacity(0.6),
                  size: 16.sp,
                ),
                Text(
                  "Swap",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: appTextColor,
                      fontFamily: AppStrings.regular),
                ),
                Icon(
                  Icons.close,
                  color: Colors.white.withOpacity(0.6),
                  size: 16.sp,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 55.h,
              child: Stack(
                children: [
                  Positioned(
                      left: 1,
                      right: 1,
                      top: widgetATop + tweenValue,
                      child: widgetA(context)),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: widgetBTop - tweenValue,
                      child: widgetB(context)),
                  Positioned(
                    left: 34.w,
                    right: 34.w,
                    top: 21.h,
                    child: InkWell(
                      onTap: () {
                        swapped ? controller.reverse() : controller.forward();
                        swapped = !swapped;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: 8.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Container(
                          height: 6.h,
                          width: 6.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Transform.rotate(
                              angle: 45.6,
                              child: const Icon(Icons.compare_arrows_rounded)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  Text(
                    "Rate",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: appGreyColor,
                        fontFamily: AppStrings.regular),
                  ),
                  const Spacer(),
                  Text(
                    "1 BTC = 16.6 ETH",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: appTextColor,
                        fontFamily: AppStrings.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: const Divider(
                thickness: 0.2,
                color: appGreyColor,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  Text(
                    "Price impact",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: appGreyColor,
                        fontFamily: AppStrings.regular),
                  ),
                  const Spacer(),
                  Text(
                    "0.02%",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFF7fe2e2),
                        fontFamily: AppStrings.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: const Divider(
                thickness: 0.2,
                color: appGreyColor,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  Text(
                    "Liquidity provider fee",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: appGreyColor,
                        fontFamily: AppStrings.regular),
                  ),
                  const Spacer(),
                  Text(
                    "2.25 USDT",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: appTextColor,
                        fontFamily: AppStrings.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetA(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      height: 26.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF323641), Color(0xFF42618b), Color(0xFF406374)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You send",
            style: TextStyle(
                fontSize: 10.sp,
                color: appGreyColor,
                fontFamily: AppStrings.regular),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.w),
                height: 4.h,
                width: 4.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ImageIcon(AssetImage(AppImages.bitcoin)),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "BTC",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.bold),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 12.sp,
              ),
              const Spacer(),
              SizedBox(
                height: 5.h,
                width: 20.w,
                child: TextField(
                  controller: btcController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    btctoethConvertor(value, true);
                    setState(() {});
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: appTextColor,
                      fontFamily: AppStrings.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF737c9e)),
              child: Text(
                "BITCOIN",
                style: TextStyle(
                    fontSize: 8.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          const Divider(
            thickness: 0.5,
            color: appGreyColor,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Text(
                "Balance:",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
              const Spacer(),
              Text(
                "0.09681609",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                "MAX",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF7fe2e2),
                    fontFamily: AppStrings.regular),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget widgetB(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      height: 26.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF323641),
                Color(0xFF487379),
                Color(0xFF4b7d84)
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You send",
            style: TextStyle(
                fontSize: 10.sp,
                color: appGreyColor,
                fontFamily: AppStrings.regular),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.w),
                height: 4.h,
                width: 4.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ImageIcon(AssetImage(AppImages.etherium)),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "ETH",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.bold),
              ),
              SizedBox(
                width: 2.w,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 12.sp,
              ),
              const Spacer(),
              SizedBox(
                height: 5.h,
                width: 20.w,
                child: TextField(
                  controller: ethController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    btctoethConvertor(value, false);
                    setState(() {});
                  },
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: appTextColor,
                      fontFamily: AppStrings.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF737c9e)),
              child: Text(
                "ETHERIUM",
                style: TextStyle(
                    fontSize: 8.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          const Divider(
            thickness: 0.5,
            color: appGreyColor,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Text(
                "Balance:",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
              const Spacer(),
              Text(
                "0.00862294",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
