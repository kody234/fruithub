import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:fruit_hub/utils/custom_elevated_button.dart';

class FruitDetailScreen extends StatelessWidget {
  const FruitDetailScreen({Key? key, required this.fruitSalad})
      : super(key: key);
  final FruitSalad fruitSalad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
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
            height: 10.h,
          ),
          Hero(
            tag: 'fruit',
            child: Center(
              child: Image.asset(
                'assets/${fruitSalad.imageUrl}.png',
                height: 176.h,
                width: 176.w,
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruitSalad.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32.sp,
                      color: const Color(0xff27214D),
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            child: const Center(child: Icon(Icons.remove)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xff333333), width: 2.w),
                            ),
                          ),
                          SizedBox(
                            width: 24.h,
                          ),
                          Text(
                            '${fruitSalad.quantity}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp,
                              color: const Color(0xff27214D),
                            ),
                          ),
                          SizedBox(
                            width: 24.h,
                          ),
                          Container(
                            height: 32.h,
                            width: 32.w,
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: Color(0xffFFA451),
                            )),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFF2E7),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'N${fruitSalad.price}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                          color: const Color(0xff27214D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Divider(
                    thickness: 2.h,
                    color: const Color(0xffF3F3F3),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: 153.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'One Pack Contains:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: const Color(0xff27214D),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Divider(
                          thickness: 2.h,
                          color: const Color(0xffFFA451),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color(0xff5D577E),
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Text(
                    'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Color(0xffFFA451),
                        ),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffFFF7F0)),
                      ),
                      SizedBox(
                        height: 56.h,
                        width: 219,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          label: 'Add to basket',
                          backgroundColor: const Color(0xffFFA451),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
