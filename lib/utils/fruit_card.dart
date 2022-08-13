import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/screens/fruit_detail_screen.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

class FruitCard extends StatelessWidget {
  FruitCard({
    Key? key,
  }) : super(key: key);
  NavigationManager navigationManager = NavigationManager();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationManager.push(context, const FruitDetailScreen());
      },
      child: Container(
        height: 193.h,
        width: 152.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16.r,
            ),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  offset: const Offset(-5, 5),
                  color: const Color(0xff202020).withOpacity(0.5))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.favorite_border,
                color: const Color(0xffFFA451),
                size: 25.sp,
              ),
            ),
            Hero(
              tag: 'fruit',
              child: Center(
                child: Image.asset(
                  'assets/fruit.png',
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                'Honey lime combo',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xff5D577E),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'N2,000',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: const Color(0xffFFA451),
                  ),
                ),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFF2E7),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xffFFA451),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
