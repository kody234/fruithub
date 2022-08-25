import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/form_validation/form_validation.dart';
import 'package:fruit_hub/services/firebase_authentication_services.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';

import '../utils/custom_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key, required this.auth}) : super(key: key);
  final FirebaseAuth auth;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool buttonActivated = false;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 21.h),
                  SizedBox(
                    height: 32.h,
                    width: 80.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                          ),
                          Text(
                            'Go back',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              color: const Color(0xff27214D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 198.h),
                  Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: const Color(0xFFFF6007),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Center(
                    child: Text(
                      'Please type in the email address linked to your Ideal account to reset your password.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: const Color(0xFF979797),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: CustomFormField(
                      hintText: 'Email',
                      controller: emailController,
                      validator: FormValidation().validateEmail,
                    ),
                  ),
                  SizedBox(height: 21.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: CustomElevatedButton(
                        activated: buttonActivated,
                        onPressed: () async {
                          if (_key.currentState?.validate() == true) {
                            setState(() {
                              buttonActivated = true;
                            });
                            await AuthenticationServices(auth: widget.auth)
                                .resetPassword(
                                    email: emailController.text.trim(),
                                    context: context);
                            setState(() {
                              buttonActivated = false;
                            });
                          }
                        },
                        label: 'Verify',
                        backgroundColor: const Color(0xffFFA451),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
