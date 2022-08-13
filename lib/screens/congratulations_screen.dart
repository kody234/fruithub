import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/screens/delivery_status_screen.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';
import 'package:fruit_hub/utils/custom_modal_sheet.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 116.h, left: 64.w, right: 64.w),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20.sp),
                    height: 164.h,
                    width: 164.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffE0FFE5),
                      border:
                          Border.all(width: 2, color: const Color(0xff4CD964)),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 45.sp,
                      ),
                      decoration: const BoxDecoration(
                          color: Color(0xff4CD964), shape: BoxShape.circle),
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Congratulations!!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: const Color(0xff27214D),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Your order have been taken and is being attended to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: const Color(0xff27214D),
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
                SizedBox(
                  height: 56.h,
                  width: 133.w,
                  child: CustomElevatedButton(
                    label: 'Track order',
                    backgroundColor: const Color(0xffFFA451),
                    onPressed: () {
                      NavigationManager()
                          .push(context, const DeliveryStatusScreen());
                    },
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                SizedBox(
                    width: 181.w,
                    height: 56,
                    child: CustomOutlinedButton(
                        label: 'Continue shopping', onPressed: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
