import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:fruit_hub/screens/cart_screen.dart';

import '../utils/custom_drawer.dart';
import '../utils/custom_form_field.dart';
import '../utils/custom_icon_button.dart';

import '../utils/custom_list_view.dart';
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

  String name = '';
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List searchedItems = FruitSalad.samples
        .where((element) => element.name.contains(name))
        .toList();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(widget: widget),
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
                          debugPrint('hvhjv');
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
                  child: CustomFormField(
                    action: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    icon: Icons.search,
                    hintText: 'Search for fruit salad combos',
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                name == ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    rebuild: rebuild,
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
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                      labelStyle: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                      unselectedLabelColor:
                                          const Color(0xff938DB5),
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          CustomListView(
                                            category: FruitSalad.hottest,
                                            rebuild: rebuild,
                                          ),
                                          CustomListView(
                                            category: FruitSalad.popular,
                                            rebuild: rebuild,
                                          ),
                                          CustomListView(
                                            category: FruitSalad.New,
                                            rebuild: rebuild,
                                          ),
                                          CustomListView(
                                            category: FruitSalad.top,
                                            rebuild: rebuild,
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 29.h,
                                  ),
                                ],
                              )),
                        ],
                      )
                    : SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: searchedItems.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20.w,
                                      mainAxisSpacing: 20.h),
                              itemBuilder: (context, index) {
                                return FruitCard(
                                    rebuild: rebuild,
                                    fruitSalad: searchedItems[index],
                                    shadow: false,
                                    color: true);
                              }),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
