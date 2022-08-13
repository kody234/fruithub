import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
