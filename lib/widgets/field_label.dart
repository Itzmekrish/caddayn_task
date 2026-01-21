import 'package:flutter/material.dart';
import 'package:task4/constants/app_text_styles.dart';

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: AppTextStyles.label),
    );
  }
}
