import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/model/fruit_salad_model.dart';
import 'package:hive/hive.dart';

import '../utils/fruit_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('favourite');
    List<FruitSalad> favourites = box.values.toList().cast<FruitSalad>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFA451),
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.sp),
        ),
      ),
      body: box.isEmpty
          ? const Center(child: Text('you have no favourites'))
          : Padding(
              padding: EdgeInsets.only(top: 20.h, right: 24.h, left: 24.h),
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: box.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h),
                  itemBuilder: (context, index) {
                    return FruitCard(
                        rebuild: rebuild,
                        fruitSalad: favourites[index],
                        shadow: false,
                        color: true);
                  }),
            ),
    );
  }
}
