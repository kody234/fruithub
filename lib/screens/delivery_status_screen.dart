import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryStatusScreen extends StatefulWidget {
  const DeliveryStatusScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryStatusScreen> createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  int stepperIndex = 0;
  bool buttonActivated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Row(
                children: [
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
                  SizedBox(
                    width: 14.h,
                  ),
                  Text(
                    'Delivery Status',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Stepper(
                      onStepTapped: (index) {
                        setState(() {});
                        stepperIndex = index;
                      },
                      steps: const [
                        Step(title: Text(''), content: Text('content')),
                        Step(
                          title: Text(''),
                          content: Text('content'),
                        ),
                        Step(title: Text(''), content: Text('content')),
                      ],
                      currentStep: stepperIndex,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
