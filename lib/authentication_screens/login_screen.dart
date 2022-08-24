import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/authentication_screens/signup_screen.dart';

import 'package:fruit_hub/services/firebase_authentication_services.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';
import 'package:fruit_hub/utils/custom_form_field.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

import '../../utils/custom_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.auth}) : super(key: key);
  final FirebaseAuth? auth;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 33.h,
                ),
                CustomFormField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomFormField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  width: 205.w,
                  height: 59.h,
                  child: CustomElevatedButton(
                      backgroundColor: const Color(0xffFFA451),
                      onPressed: () {
                        AuthenticationServices(auth: widget.auth!).signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                      },
                      label: 'Log in'),
                ),
                SizedBox(
                  height: 43.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 34.h,
                ),
                SizedBox(
                  width: 160.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/facebook_logo.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                      Image.asset(
                        'assets/google_logo.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Don’t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff230A06).withOpacity(0.5),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('tapped');
                              return NavigationManager().pushReplacement(
                                context,
                                const SignUpScreen(),
                              );
                            },
                          text: ' Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xff230A06),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
