import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/basket.zip', height: 500.h, width: 500.w),
        Text(
          'Your Basket is empty',
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        )
      ],
    );
  }
}
