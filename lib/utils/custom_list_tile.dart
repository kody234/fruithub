import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/services/firestore_database_services.dart';
import 'package:fruit_hub/utils/custom_icon_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.productId,
  }) : super(key: key);
  final String name;
  final int price;
  final int quantity;
  final String imageUrl;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: InkWell(
        splashColor: const Color(0xffFFA451),
        onTap: () {},
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.shade400,
              )),
          leading: Image.asset(
            'assets/$imageUrl.png',
            height: 50.h,
            width: 50.w,
            fit: BoxFit.fill,
          ),
          title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.black),
          ),
          subtitle: Text(
            '$quantity packs',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.black),
          ),
          trailing: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'N$price',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xff27214D),
                ),
              ),
              CustomIconButton(
                onPressed: () async {
                  await FireStoreServices()
                      .deleteFromCart(productId: productId, context: context);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerCustomListTile extends StatelessWidget {
  const DrawerCustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            tileColor: const Color(0xffFFA451),
            leading: Icon(
              icon,
              size: 35.sp,
              color: Colors.white,
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19.sp),
            ),
          ),
        ),
      ),
    );
  }
}
