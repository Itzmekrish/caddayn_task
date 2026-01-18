import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 68),

            SignupHeader(),

            SizedBox(height: 24),

            FieldLabel(text: "Name"),
            SizedBox(height: 8),
            AppTextField(hint: "Your name"),

            SizedBox(height: 16),

            FieldLabel(text: "Email Address"),
            SizedBox(height: 8),
            AppTextField(hint: "name@email.com"),

            SizedBox(height: 16),

            FieldLabel(text: "Password"),
            SizedBox(height: 8),
            PasswordField(hint: "Create a password"),

            SizedBox(height: 16),

            PasswordField(hint: "Confirm password"),

            SizedBox(height: 24),

            TermsAndConditions(),
          ],
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
          hintStyle: TextStyle(fontSize: 14,color: Color(0xFF8F9098))
        ),
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
        decoration:  AppInputDecoration().copyWith(
          hintText:hint,
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
          child: Wrap(
            children: [
              const Text(
                "I've read and agree with the ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF71727A),
                ),
              ),

              GestureDetector(
                onTap: () {
                  print("Terms and Conditions tapped");
                },
                child: const Text(
                  "Terms and Conditions",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Text(
                " and the ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF71727A),
                ),
              ),

              GestureDetector(
                onTap: () {
                  print("Privacy Policy tapped");
                },
                child: const Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Text(
                ".",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF71727A),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
