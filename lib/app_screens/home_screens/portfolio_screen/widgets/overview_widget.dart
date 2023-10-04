import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            height: 20.h,
            width: 45.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF64fee2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total M.Cap",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: appGreyColor,
                      fontFamily: AppStrings.regular),
                ),
                SizedBox(height: 1.h),
                Text(
                  "\$2.25T",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontFamily: AppStrings.regular),
                ),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                        color: Color(0xFF57d9c1),
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      "+3.46%",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppStrings.bold,
                          fontSize: 8.sp),
                    ))
              ],
            )),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          height: 20.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFF3640f0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total M.Cap",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: appGreyColor,
                    fontFamily: AppStrings.regular),
              ),
              SizedBox(height: 1.h),
              Text(
                "\$2.25T",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: appTextColor,
                    fontFamily: AppStrings.regular),
              ),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  height: 4.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                      color: Color(0xFF3138cc),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "+3.46%",
                    style: TextStyle(
                        color: appTextColor,
                        fontFamily: AppStrings.bold,
                        fontSize: 8.sp),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
