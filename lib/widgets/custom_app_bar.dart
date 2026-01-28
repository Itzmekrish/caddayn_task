import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double height;

  const CustomAppBar(
      {super.key,
        required this.title,
        this.leftIcon,
        this.rightIcon,
        this.height = 56});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(
            title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          rightIcon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}