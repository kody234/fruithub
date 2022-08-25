import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/form_validation/form_validation.dart';
import 'package:fruit_hub/main.dart';
import 'package:fruit_hub/screens/home_screen.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';
import 'package:hive/hive.dart';

import '../../utils/custom_elevated_button.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool buttonActivated = false;

    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: Form(
        key: _key,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 60.h),
                      height: 343.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is your firstname?',
                            style: TextStyle(
                                color: const Color(0xff27214D),
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            validator: FormValidation().defaultFormValidator,
                            decoration: InputDecoration(
                              hintText: 'enter name',
                              fillColor: const Color(0xffF3F1F1),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.r)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ),
                          SizedBox(
                            height: 48.h,
                          ),
                          SizedBox(
                            height: 56.h,
                            width: MediaQuery.of(context).size.width,
                            child: CustomElevatedButton(
                              activated: buttonActivated,
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  await Hive.box('onboarding').add('completed');
                                  NavigationManager().pushReplacement(
                                    context,
                                    const Root(),
                                  );
                                }
                              },
                              backgroundColor: const Color(0xffFFA451),
                              label: 'Start Ordering',
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
