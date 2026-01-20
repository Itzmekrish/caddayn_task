import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const SocialIcon({
    super.key,
    required this.assetPath,
    required this.onTap,
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
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
