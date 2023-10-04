import 'package:dextrlabstask/constants/app_colors.dart';
import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static InputDecoration textFieldDecoration(
    String labelText, {
    Widget? prefixIcon,
    String? fontFamily,
    bool isBorder = true,
    Color? filledColor,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      labelText: labelText,
      // fillColor: filledColor ?? const Color(0xFF0D0D0D),
      filled: true,
      contentPadding: EdgeInsets.only(left: 6.w, top: 2.5.h, bottom: 3.h),
      labelStyle: TextStyle(
          color: appTextColor.withOpacity(0.5),
          fontSize: 10.sp,
          fontFamily: fontFamily ?? AppStrings.regular),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: isBorder
            ? BorderSide(color: Colors.white.withOpacity(0.5))
            : BorderSide.none,
      ),
      // Regular border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: isBorder
            ? BorderSide(color: Colors.white.withOpacity(0.5))
            : BorderSide.none,
      ),
      // Focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: isBorder
            ? BorderSide(color: Colors.white.withOpacity(0.5))
            : BorderSide.none,
      ),
      // Error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      // Disabled border
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }

  static InputDecoration passwordFieldInputDecoration(
      String labelText, Widget suffix) {
    return InputDecoration(
      labelText: labelText,
      contentPadding: EdgeInsets.only(left: 6.w, top: 2.5.h, bottom: 3.h),
      labelStyle: TextStyle(color: appTextColor.withOpacity(0.5)),

      suffixIcon: suffix,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
      // Regular border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
      // Focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
      // Error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
      // Disabled border
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}
