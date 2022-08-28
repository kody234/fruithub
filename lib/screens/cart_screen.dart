import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';
import 'package:lottie/lottie.dart';

import '../utils/custom_modal_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: SizedBox(
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
              ),
              SizedBox(
                width: 34.w,
              ),
              Text(
                'My Basket',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          const Expanded(
            child: WhiteContainer(),
          )
        ],
      )),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool buttonActivated = false;
    return Container(
      padding: EdgeInsets.only(top: 40.h),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                List cartList = FruitSalad.samples
                    .where((element) =>
                        element.productId ==
                        snapshot.data?['cart'].contains({element.productId: 1}))
                    .toList();

                if (snapshot.hasError) {
                  return const Text('has error');
                }
                if (snapshot.hasData) {
                  if (!snapshot.data?['cart'].isEmpty) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              height: 100,
                              width: 100,
                              color: Colors.yellowAccent,
                            ),
                          );
                        });
                  } else {
                    return const CustomAnimation();
                  }
                }
                return const Center(child: CircularProgressIndicator());
              }),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                height: 80.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'N20,000',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24.sp,
                              color: const Color(0xff27214D)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 56.h,
                      width: 199.w,
                      child: CustomElevatedButton(
                        activated: buttonActivated,
                        backgroundColor: const Color(0xffFFA451),
                        label: 'Checkout',
                        onPressed: () {
                          customModalSheet(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_izbswkzm.json',
            height: 500.h,
            width: 500.w),
        Text(
          'Your Basket is empty',
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        )
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/fruit.png', height: 40.h, width: 40.w),
      title: Text(
        'Quinoa fruit salad',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),
      ),
      subtitle: Text(
        '2packs',
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.black),
      ),
      trailing: Text(
        'N20,000',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xff27214D)),
      ),
    );
  }
}
