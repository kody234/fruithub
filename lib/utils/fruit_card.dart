import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:fruit_hub/screens/fruit_detail_screen.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';
import 'package:hive/hive.dart';

class FruitCard extends StatelessWidget {
  final FruitSalad fruitSalad;
  final bool shadow;
  final bool color;
  final VoidCallback? rebuild;

  FruitCard(
      {Key? key,
      required this.fruitSalad,
      required this.shadow,
      required this.color,
      this.rebuild})
      : super(key: key);
  final NavigationManager navigationManager = NavigationManager();

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('favourite');
    return InkWell(
      onTap: () {
        navigationManager.push(
            context,
            FruitDetailScreen(
              rebuild: rebuild,
              fruitSalad: fruitSalad,
            ));
      },
      child: Container(
        height: 193.h,
        width: 152.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: color ? Color(fruitSalad.color) : Colors.white,
            borderRadius: BorderRadius.circular(
              16.r,
            ),
            boxShadow: shadow
                ? [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(-5, 5),
                        color: const Color(0xff202020).withOpacity(0.5))
                  ]
                : []),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomFavouriteIcon(box: box, fruitSalad: fruitSalad),
            ),
            Hero(
              tag: fruitSalad.name,
              child: Center(
                child: Image.asset(
                  'assets/${fruitSalad.imageUrl}.png',
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                fruitSalad.name,
                overflow: TextOverflow.ellipsis,
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
                  'N${fruitSalad.price}',
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

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({
    Key? key,
    required this.box,
    required this.fruitSalad,
  }) : super(key: key);

  final Box box;
  final FruitSalad fruitSalad;

  @override
  Widget build(BuildContext context) {
    return Icon(
      box.containsKey(fruitSalad.productId)
          ? Icons.favorite
          : Icons.favorite_border,
      color: box.containsKey(fruitSalad.productId)
          ? Colors.red
          : const Color(0xffFFA451),
      size: 25.sp,
    );
  }
}
