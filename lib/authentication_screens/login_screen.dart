import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/authentication_screens/forgot_password_screen.dart';
import 'package:fruit_hub/authentication_screens/signup_screen.dart';
import 'package:fruit_hub/form_validation/form_validation.dart';

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

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FormValidation _validator = FormValidation();
  bool buttonActivated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Center(
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
                    validator: _validator.validateEmail,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomFormField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    controller: passwordController,
                    validator: _validator.passwordValidator,
                    obscure: true,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        NavigationManager().push(
                          context,
                          ForgotPasswordScreen(
                            auth: widget.auth!,
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  SizedBox(
                    width: 205.w,
                    height: 59.h,
                    child: CustomElevatedButton(
                        activated: buttonActivated,
                        backgroundColor: const Color(0xffFFA451),
                        onPressed: () async {
                          if (_key.currentState?.validate() == true) {
                            setState(() {
                              buttonActivated = true;
                            });
                            await AuthenticationServices(auth: widget.auth!)
                                .signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              context: context,
                            );
                            setState(() {
                              buttonActivated = false;
                            });
                          }
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
                                return NavigationManager().push(
                                  context,
                                  SignUpScreen(
                                    auth: widget.auth,
                                  ),
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
      ),
    );
  }
}
