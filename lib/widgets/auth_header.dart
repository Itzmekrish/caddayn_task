import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.header),
        const SizedBox(height: 8),
        Text(subtitle, style: AppTextStyles.subtitle),
      ],
    );
  }
}

