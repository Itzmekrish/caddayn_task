import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../constants/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.4, // 👈 adjust size here
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: const BorderSide(
              color: Color(0xFFC5C6CC),
              width: 1.5,
            ),
            value: false,
            onChanged: (value) {
              print("Terms checkbox clicked");
            },
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: RichText(
            softWrap: true,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF71727A),
              ),
              children: [
                const TextSpan(
                  text: "I've read and agree with the ",
                ),
                TextSpan(
                  text: "Terms and Conditions",
                  style: const TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Terms and Conditions tapped");
                    },
                ),
                const TextSpan(
                  text: " and the ",
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: const TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Privacy Policy tapped");
                    },
                ),
                const TextSpan(
                  text: ".",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}