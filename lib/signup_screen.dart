import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 812,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 68),

                const SignupHeader(),

                const SizedBox(height: 24),

                const FieldLabel(text: "Name"),
                const SizedBox(height: 8),
                const AppTextField(hint: "Your name"),

                const SizedBox(height: 16),

                const FieldLabel(text: "Email Address"),
                const SizedBox(height: 8),
                const AppTextField(hint: "name@email.com"),

                const SizedBox(height: 16),

                const FieldLabel(text: "Password"),
                const SizedBox(height: 8),
                const PasswordField(hint: "Create a password"),

                const SizedBox(height: 16),

                const PasswordField(hint: "Confirm password"),

                const SizedBox(height: 24),

                const TermsAndConditions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ===========================
   HEADER
=========================== */

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign up",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Create an account to get started",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF71727A),
          ),
        ),
      ],
    );
  }
}

/* ===========================
   LABEL
=========================== */

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/* ===========================
   NORMAL TEXT FIELD
=========================== */

class AppTextField extends StatelessWidget {
  final String hint;

  const AppTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        onChanged: (value) {
          print("Typed: $value");
        },
        decoration: AppInputDecoration().copyWith(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14, color: Color(0xFF8F9098))),
      ),
    );
  }
}

/* ===========================
   PASSWORD FIELD
=========================== */

class PasswordField extends StatelessWidget {
  final String hint;

  const PasswordField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        onChanged: (value) {
          print("Typed: $value");
        },
        obscureText: true,
        decoration: AppInputDecoration().copyWith(
          hintText: hint,
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
          suffixIconConstraints: BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
        ),
      ),
    );
  }
}

/* ===========================
   INPUT DECORATION
=========================== */

class AppInputDecoration extends InputDecoration {
  AppInputDecoration()
      : super(
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF8F9098),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color(0xFFC5C6CC),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color(0xFF2563EB),
              width: 1.5,
            ),
          ),
        );
}

/* ===========================
   TERMS & CONDITIONS
=========================== */

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
