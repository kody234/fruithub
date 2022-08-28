import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:fruit_hub/screens/cart_screen.dart';

import '../services/firebase_authentication_services.dart';
import '../utils/custom_form_field.dart';
import '../utils/custom_icon_button.dart';
import '../utils/fruit_card.dart';
import '../utils/navigation_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.auth}) : super(key: key);
  final FirebaseAuth auth;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Row()),
            ElevatedButton(
              onPressed: () {
                AuthenticationServices(auth: widget.auth).signOut();
              },
              child: const Text('sign out'),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 17.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                          print('hvhjv');
                        },
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
                              color: const Color(0xff27214D),
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
                    icon: Icons.search,
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
                    children: List.generate(
                      FruitSalad.recommended.length,
                      (index) => FruitCard(
                          fruitSalad: FruitSalad.recommended[index],
                          shadow: true,
                          color: false),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.h,
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
                                fontSize: 22.sp, fontWeight: FontWeight.w500),
                            unselectedLabelColor: const Color(0xff938DB5),
                            indicatorColor: const Color(0xffFFA451),
                            labelColor: const Color(0xff5D577E),
                            tabs: const [
                              Tab(
                                text: 'Hottest',
                              ),
                              Tab(
                                text: 'Popular',
                              ),
                              Tab(
                                text: 'New',
                              ),
                              Tab(
                                text: 'Top',
                              )
                            ]),
                        SizedBox(
                          height: 200.h,
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                CustomListView(
                                  category: FruitSalad.hottest,
                                ),
                                CustomListView(
                                  category: FruitSalad.popular,
                                ),
                                CustomListView(
                                  category: FruitSalad.New,
                                ),
                                CustomListView(
                                  category: FruitSalad.top,
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 29.h,
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

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.category,
  }) : super(key: key);
  final List<FruitSalad> category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w, top: 10.h),
            child: FruitCard(
                fruitSalad: category[index], shadow: false, color: true),
          );
        });
  }
}
