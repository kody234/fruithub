import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/screens/cart_screen.dart';

import '../utils/custom_form_field.dart';
import '../utils/custom_icon_button.dart';
import '../utils/fruit_card.dart';
import '../utils/navigation_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 47.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu_rounded,
                          size: 24.sp,
                          color: const Color(0xff27214D),
                        ),
                      ),
                      Column(
                        children: [
                          CustomIconButton(
                            onPressed: () {
                              NavigationManager().push(
                                context,
                                const CartScreen(),
                              );
                            },
                            icon: Icon(
                              Icons.shopping_basket,
                              size: 24.sp,
                              color: const Color(0xffFFA451),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'My basket',
                            style: TextStyle(
                              color: Color(0xff27214D),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    'Hello Tony, What fruit salad combo do you want today?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: const Color(0xff5D577E),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: const CustomFormField(
                    hintText: 'Search for fruit salad combos',
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Recommended Combo',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: const Color(0xff5D577E),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FruitCard(),
                      FruitCard(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            unselectedLabelStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                            labelStyle: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w500),
                            unselectedLabelColor: const Color(0xff938DB5),
                            indicatorColor: const Color(0xffFFA451),
                            labelColor: const Color(0xff5D577E),
                            tabs: const [
                              Tab(
                                text: 'demo',
                              ),
                              Tab(
                                text: 'demo',
                              ),
                              Tab(
                                text: 'demo',
                              ),
                              Tab(
                                text: 'demo',
                              )
                            ]),
                        SizedBox(
                          height: 200.h,
                          child: TabBarView(children: [
                            Icon(Icons.bookmark),
                            Icon(Icons.bookmark),
                            Icon(Icons.bookmark),
                            Icon(Icons.bookmark)
                          ]),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
