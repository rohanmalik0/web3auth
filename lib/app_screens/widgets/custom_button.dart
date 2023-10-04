import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  const CustomButton({
    required this.buttonName,
    required this.onTap,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 83.w,
        height: height ?? 6.h,
        decoration: BoxDecoration(
            color: appPrimaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: appPrimaryColor.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(-1, 2))
            ]),
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 12.sp,
              fontFamily: AppStrings.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
