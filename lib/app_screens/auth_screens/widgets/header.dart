import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "SOLIDITY",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: appTextColor,
                  fontFamily: AppStrings.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2.5.h,
                  width: 2.5.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    "S",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontFamily: AppStrings.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2.5.h,
                  width: 2.5.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    "W",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontFamily: AppStrings.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2.5.h,
                  width: 2.5.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    "A",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontFamily: AppStrings.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2.5.h,
                  width: 2.5.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    "P",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontFamily: AppStrings.bold),
                  ),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        Transform.rotate(
          angle: 45.6,
          child: Text(
            "DeFi",
            style: TextStyle(
              fontSize: 12.sp,
              color: appTextColor,
              fontFamily: AppStrings.regular,
            ),
          ),
        )
      ],
    );
  }
}
