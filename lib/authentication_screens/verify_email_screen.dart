import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';
import 'package:fruit_hub/utils/custom_snackbar.dart';

class VerifyEmailScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final AsyncSnapshot snapshot;
  final VoidCallback rebuild;

  VerifyEmailScreen({Key? key, required this.snapshot, required this.rebuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool buttonActivated = false;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'verify your mail to continue',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 23.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 50.h,
              width: 200.w,
              child: CustomElevatedButton(
                  activated: buttonActivated,
                  backgroundColor: const Color(0xffFFA451),
                  onPressed: () async {
                    await user?.reload();

                    if (_auth.currentUser!.emailVerified) {
                      rebuild();
                      debugPrint('email is verified');
                    } else {
                      debugPrint(_auth.currentUser!.emailVerified.toString());

                      showSnackBar(
                          context: context,
                          label:
                              'Check your email for a verification link first. ',
                          backGroundColor: Colors.red);
                    }
                  },
                  label: 'Click to verify'),
            )
          ],
        ),
      ),
    );
  }
}
