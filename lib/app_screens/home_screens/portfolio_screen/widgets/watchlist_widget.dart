import 'package:dextrlabstask/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Center(
          child: Text("Your Watchlist will seen here",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppStrings.regular,
                  fontSize: 10.sp))),
    );
  }
}
