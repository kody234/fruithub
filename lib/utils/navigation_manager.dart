import 'package:flutter/material.dart';

class NavigationManager {
  void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => screen));
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
