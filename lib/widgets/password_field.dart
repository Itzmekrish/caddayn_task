import 'package:flutter/material.dart';
import 'package:task4/constants/app_sizes.dart';
import 'package:task4/constants/app_colors.dart';
import 'package:task4/constants/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatelessWidget {
  final String hint;

  const PasswordField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.fieldHeight,
      child: TextField(
        obscureText: true,
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
          suffixIcon: GestureDetector(
            onTap: () {
              print("Visibility icon tapped");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                'assets/icons/eyeoff.svg',
                width: 16,
                height: 16,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF8F9098),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
