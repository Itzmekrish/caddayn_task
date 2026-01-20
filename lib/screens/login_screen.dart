import 'package:flutter/material.dart';
import 'package:task4/widgets/primary_button.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../widgets/auth_header.dart';
import '../widgets/app_text_field.dart';
import '../widgets/password_field.dart';
import '../widgets/social_icon.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: AppSizes.screenWidth,
            height: AppSizes.screenHeight,
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Image WITHOUT padding
                ClipRRect(
                  child: Image.asset(
                    'assets/images/coffee.png',
                    height: 312,
                    width: 375,
                    fit: BoxFit.cover,
                  ),
                ),

                // 🔹 Everything else WITH padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const AuthHeader(
                        title: "Welcome!",
                        subtitle: "",
                      ),
                      const AppTextField(hint: "Email Address"),
                      const SizedBox(height: 16),
                      const PasswordField(hint: "Password"),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          print("Forgot password clicked");
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(text: "Login",onTap: (){print("Login clicked");}),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not a member? ",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryText,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Register now clicked");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Register now",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: const [
                          Divider(),
                          SizedBox(height: 20),


                          Text(
                            "Or continue with",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryText,
                            ),
                          ),


                        ],
                      ),

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIcon(
                            assetPath: 'assets/icons/google.svg',
                            onTap: () => print("Google clicked"),
                          ),
                          SocialIcon(
                            assetPath: 'assets/icons/apple.svg',
                            onTap: () => print("Apple clicked"),
                          ),
                          SocialIcon(
                            assetPath: 'assets/icons/facebook.svg',
                            onTap: () => print("Facebook clicked"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
