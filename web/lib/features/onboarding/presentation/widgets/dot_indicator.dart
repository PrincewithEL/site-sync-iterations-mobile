import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppPallete.gradient3 : AppPallete.whiteColor,
        border: isActive ? null : Border.all(color: AppPallete.gradient3),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}