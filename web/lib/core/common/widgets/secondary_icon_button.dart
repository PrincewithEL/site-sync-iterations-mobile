import 'package:flutter/material.dart';
import 'package:site_sync/core/images/app_images.dart';

import '../../../core/theme/app_pallete.dart';

class SecondaryIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String text;

  const SecondaryIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(56, 56),
        backgroundColor: AppPallete.transparent,
        shadowColor: AppPallete.transparent,
        elevation: 0,
        side: const BorderSide(
          color: AppPallete.whiteColor,
          width: 2,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Slightly rounded corners
        ),
        padding: EdgeInsets.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppPallete.whiteColor,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppPallete.whiteColor,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
