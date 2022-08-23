import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: const Color(0xff232E24).withOpacity(0.6),
            ),
          ),
          Text(
            'Or',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22.sp,
                color: Colors.black),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: const Color(0xff232E24).withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
