import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.label,
    this.activated,
  }) : super(key: key);
  final Color backgroundColor;
  final String label;
  final VoidCallback onPressed;
  final bool? activated;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: backgroundColor),
      onPressed: onPressed,
      child: activated!
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
    );
  }
}
