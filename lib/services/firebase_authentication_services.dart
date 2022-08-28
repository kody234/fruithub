import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/custom_snackbar.dart';

class AuthenticationServices {
  final FirebaseAuth auth;
  AuthenticationServices({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      debugPrint('success');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      showSnackBar(
          context: context,
          label: e.code.toString(),
          backGroundColor: Colors.red);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerificationLink(context: context);
      debugPrint('success');
    } on FirebaseAuthException catch (e) {
      showSnackBar(
          context: context, label: e.message!, backGroundColor: Colors.red);
      debugPrint(e.message);
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> sendEmailVerificationLink(
      {required BuildContext context}) async {
    try {
      await auth.currentUser?.sendEmailVerification();
      showSnackBar(
          context: context,
          label: 'Verification link has been sent',
          backGroundColor: Colors.green);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      showSnackBar(
          context: context, label: e.message!, backGroundColor: Colors.red);
    }
  }

  Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackBar(
          context: context,
          label: 'Check email for reset link',
          backGroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        label: e.message.toString(),
        backGroundColor: Colors.red,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
