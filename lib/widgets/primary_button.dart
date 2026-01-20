import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final TextStyle textStyle;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 48,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.backgroundColor = const Color(0xFF2563EB),
    this.textStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: AppSizes.fieldHeight,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
