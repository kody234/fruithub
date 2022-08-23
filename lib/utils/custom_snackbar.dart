import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String label,
    required Color backGroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(label),
    backgroundColor: backGroundColor,
  ));
}
