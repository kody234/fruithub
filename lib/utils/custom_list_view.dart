import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/fruit_salad_model.dart';
import 'fruit_card.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.category,
    required this.rebuild,
  }) : super(key: key);
  final List<FruitSalad> category;
  final VoidCallback rebuild;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w, top: 10.h),
            child: FruitCard(
                rebuild: rebuild,
                fruitSalad: category[index],
                shadow: false,
                color: true),
          );
        });
  }
}
