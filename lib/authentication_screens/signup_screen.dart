import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_hub/utils/navigation_manager.dart';

import '../../utils/custom_divider.dart';
import '../../utils/custom_elevated_button.dart';
import '../../utils/custom_form_field.dart';
import '../services/firebase_authentication_services.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, this.auth}) : super(key: key);
  final FirebaseAuth? auth;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? checkboxValue = false;

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
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 33.h,
                ),
                const CustomFormField(
                  hintText: 'Name',
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomFormField(
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CustomFormField(
                  hintText: 'Password',
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(
                          side: BorderSide(
                              color: const Color(0xffFFA451), width: 2.w),
                          activeColor: const Color(0xffFFA451),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          value: checkboxValue,
                          onChanged: (value) {
                            setState(() {});
                            debugPrint(value.toString());
                            checkboxValue = value;
                          }),
                      Text(
                        'I accept all the Terms & Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  width: 205.w,
                  height: 59.h,
                  child: CustomElevatedButton(
                      backgroundColor: Color(0xffFFA451),
                      onPressed: () {
                        AuthenticationServices(auth: widget.auth!).signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                      },
                      label: 'Sign Up'),
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
                      text: 'Already have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xff230A06).withOpacity(0.5),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => NavigationManager().pushReplacement(
                                  context,
                                  const LoginScreen(),
                                ),
                          text: ' Log In',
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
