import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'signup_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 812,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Top Image
                ClipRRect(
                  child: Image.asset(
                    'assets/images/coffee.png',
                    height: 312,
                    width: 375,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 40),

                // 🔹 Welcome Text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Email Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: 48,
                    width: 327,
                    child: TextField(
                      onChanged: (value) {
                        print("Email typed: $value");
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        hintText: "Email Address",
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
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: 48,
                    width: 327,
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        print("Password typed: $value");
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Color(0xFF8F9098),fontSize: 14),
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

                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),

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
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () {
                      print("Forgot password clicked");
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Login Button
                // 🔹 Login Button (Container-based)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      print("Login clicked");
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF006FFD),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 16),

                // 🔹 Register Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member? ",style: TextStyle(fontSize: 12,color: Color(0xFF71727A)),),
                    GestureDetector(
                      onTap: () {
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
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 24),

                Center(
                  child: SizedBox(
                    width: 327,
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                // 🔹 Divider
                const Center(child: Text("Or continue with",style: TextStyle(fontSize: 12,color: Color(0xFF71727A)),)),

                const SizedBox(height: 16),

                // 🔹 Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      assetPath: 'assets/icons/google.svg',
                      onTap: () {
                        print("Google clicked");
                      },
                    ),
                    SocialIcon(
                      assetPath: 'assets/icons/apple.svg',
                      onTap: () {
                        print("Apple clicked");
                      },
                    ),
                    SocialIcon(
                      assetPath: 'assets/icons/facebook.svg',
                      onTap: () {
                        print("Facebook clicked");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class SocialIcon extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  final double size;

  const SocialIcon({
    super.key,
    required this.assetPath,
    required this.onTap,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: SvgPicture.asset(
          assetPath,
          height: size,
          width: size,
        ),
      ),
    );
  }
}