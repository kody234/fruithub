import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

import '../../utils/custom_elevated_button.dart';
import 'onboarding2.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final bool buttonActivated = false;

  final NavigationManager _navigationManager = NavigationManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
                    height: 343.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get The Freshest Fruit Salad Combo',
                          style: TextStyle(
                              color: const Color(0xff27214D),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: const Color(0xff5D577E),
                          ),
                        ),
                        SizedBox(
                          height: 58.h,
                        ),
                        SizedBox(
                          height: 56.h,
                          width: MediaQuery.of(context).size.width,
                          child: CustomElevatedButton(
                            activated: buttonActivated,
                            onPressed: () {
                              _navigationManager.pushReplacement(
                                  context, const OnBoardingScreen2());
                            },
                            backgroundColor: const Color(0xffFFA451),
                            label: 'Let\'s continue',
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
