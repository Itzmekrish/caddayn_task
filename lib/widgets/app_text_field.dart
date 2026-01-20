import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String hint;

  const AppTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.fieldHeight,
      child: TextField(
        onChanged: (value) {
          print("User typed: $value");
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xFF8F9098),fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFC5C6CC),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF2563EB),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
