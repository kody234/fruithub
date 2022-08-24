import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/screens/congratulations_screen.dart';
import 'package:fruit_hub/utils/custom_form_field.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

Future<dynamic> customModalSheet(BuildContext context) {
  return showModalBottomSheet(
    isDismissible: false,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24.r),
      ),
    ),
    context: context,
    builder: (_) => Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          color: Colors.transparent,
        ),
        Positioned(
          top: -15,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.close),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
            height: 410.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery address',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: const Color(0xff27214D),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomFormField(
                  hintText: '10th avenue, Lekki, Lagos State',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Number we can call',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: const Color(0xff27214D),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomFormField(hintText: '09090605708'),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 56.h,
                      width: 125.w,
                      child: CustomOutlinedButton(
                        onPressed: () {
                          NavigationManager()
                              .push(context, const CongratulationScreen());
                        },
                        label: 'Pay on delivery',
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                      width: 125.w,
                      child: CustomOutlinedButton(
                        onPressed: () {},
                        label: 'Pay with card',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 2,
          color: Color(0xffFFA451),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xffFFA451)),
      ),
    );
  }
}
