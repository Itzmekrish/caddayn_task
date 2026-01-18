import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const LoginUIApp());
}

class LoginUIApp extends StatelessWidget {
  const LoginUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const LoginScreen(),
    );

  }
}
