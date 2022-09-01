import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/screens/cart_screen.dart';
import 'package:fruit_hub/screens/favourites_screen.dart';
import 'package:fruit_hub/utils/navigation_manager.dart';

import '../screens/home_screen.dart';
import '../services/firebase_authentication_services.dart';
import 'custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(child: Row()),
            DrawerCustomListTile(
              icon: Icons.shopping_basket,
              title: 'My Basket',
              onTap: () {
                NavigationManager().push(context, const CartScreen());
              },
            ),
            DrawerCustomListTile(
              icon: Icons.favorite,
              title: 'My Favourites',
              onTap: () {
                NavigationManager().push(context, const FavouriteScreen());
              },
            ),
            DrawerCustomListTile(
              icon: Icons.library_books_sharp,
              title: 'About Developer',
              onTap: () {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                AuthenticationServices(auth: widget.auth).signOut();
              },
              child: const Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
