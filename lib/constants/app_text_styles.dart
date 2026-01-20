import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const subtitle = TextStyle(
    fontSize: 12,
    color: AppColors.secondaryText,
  );

  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const hint = TextStyle(
    fontSize: 14,
    color: AppColors.hint,
  );

  static const link = TextStyle(
    fontSize: 12,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );
}
