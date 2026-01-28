import 'package:flutter/material.dart';
import 'package:task4/screens/onboarding_screen.dart';
import 'package:task4/widgets/primary_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../widgets/auth_header.dart';
import '../widgets/field_label.dart';
import '../widgets/app_text_field.dart';
import '../widgets/password_field.dart';
import '../widgets/terms_and_conditions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.screenHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding,
          ),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              
              SizedBox(height: 68),
              AuthHeader(
                title: "Sign up",
                subtitle: "Create an account to get started",
              ),
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
              SizedBox(height: 40),
              PrimaryButton(
                text: "Signup",
                onTap: () {
                  print("Signup clicked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
