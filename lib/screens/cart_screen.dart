import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_hub/utils/custom_elevated_button.dart';

import '../utils/custom_error_animation.dart';
import '../utils/custom_list_tile.dart';
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

class WhiteContainer extends StatefulWidget {
  const WhiteContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<WhiteContainer> createState() => _WhiteContainerState();
}

class _WhiteContainerState extends State<WhiteContainer> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool buttonActivated = false;

    return Container(
      padding: EdgeInsets.only(top: 40.h),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('User')
              .doc(user?.uid)
              .collection('cart')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            num count = 0;
            int getTotalPrice() {
              for (var element in snapshot.data!.docs) {
                count += (element['quantity'] * element['basePrice']);
              }
              debugPrint('ddad ${count.toString()}');
              return count.toInt();
            }

            if (snapshot.hasError) {
              return const Text('has error');
            }
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isNotEmpty) {
                getTotalPrice();
                return Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CustomListTile(
                                    quantity: snapshot.data!.docs[index]
                                        ['quantity'],
                                    name: snapshot.data!.docs[index]
                                        ['productName'],
                                    price: snapshot.data!.docs[index]
                                            ['basePrice'] *
                                        snapshot.data!.docs[index]['quantity'],
                                    imageUrl: snapshot.data!.docs[index]
                                        ['imageUrl'],
                                    productId: snapshot.data!.docs[index]
                                        ['productId'],
                                  ));
                            }),
                      ),
                    ),
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
                                    'N$count',
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
                );
              } else {
                return const CustomAnimation();
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
