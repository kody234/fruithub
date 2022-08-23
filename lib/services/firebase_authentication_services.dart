import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/custom_snackbar.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      debugPrint('success');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerificationLink(context: context);
      debugPrint('success');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> sendEmailVerificationLink(
      {required BuildContext context}) async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      showSnackBar(
          context: context,
          label: 'Verification link has been sent',
          backGroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      showSnackBar(
          context: context, label: e.message!, backGroundColor: Colors.red);
    }
  }
}
