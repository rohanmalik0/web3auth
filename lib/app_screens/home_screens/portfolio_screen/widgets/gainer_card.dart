import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_images.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GainerCard extends StatelessWidget {
  const GainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      height: 10.h,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: appGreyColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2.w),
                height: 4.h,
                width: 4.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 0.5, color: appGreyColor)),
                child: ImageIcon(
                  AssetImage(AppImages.solana),
                  size: 12.sp,
                  color: appTextColor,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "SOL",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
              Spacer(),
              Text(
                "\$22.41",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 2.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF22272b)),
                child: Text(
                  "SOLANA",
                  style: TextStyle(
                      fontSize: 8.sp,
                      color: appTextColor,
                      fontFamily: AppStrings.regular),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_upward_rounded,
                size: 12.sp,
                color: appGreyColor,
              ),
              Text(
                "3.32%",
                style: TextStyle(
                    fontSize: 8.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
            ],
          )
        ],
      ),
    );
  }
}
