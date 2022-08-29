import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/custom_snackbar.dart';

class FireStoreServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> createUser({required String name}) async {
    await userCollection.doc(user?.uid).set({
      'name': name,
      'cart': [],
      'userId': user?.uid,
    });
  }

  Future<void> addToCart(
      {required String productId,
      required String productName,
      required String imageUrl,
      required int basePrice,
      required int quantity,
      required BuildContext context}) async {
    try {
      await userCollection
          .doc(user?.uid)
          .collection('cart')
          .doc(productId)
          .set({
        'productId': productId,
        'productName': productName,
        'imageUrl': imageUrl,
        'basePrice': basePrice,
        'quantity': quantity,
      });
      showSnackBar(
          context: context,
          label: 'Item has been added to basket',
          backGroundColor: Colors.green);
    } on FirebaseException catch (e) {
      showSnackBar(
          context: context,
          label: e.message.toString(),
          backGroundColor: Colors.red);
    }
  }

  Future<void> deleteFromCart(
      {required String productId, required BuildContext context}) async {
    try {
      await userCollection
          .doc(user?.uid)
          .collection('cart')
          .doc(productId)
          .delete();
      showSnackBar(
          context: context,
          label: 'Item has been removed from basket',
          backGroundColor: Colors.green);
    } on FirebaseException catch (e) {
      showSnackBar(
          context: context,
          label: e.message.toString(),
          backGroundColor: Colors.red);
    }
  }
}
