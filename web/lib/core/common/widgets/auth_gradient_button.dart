import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthGradientButton({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.errorColor,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPallete.transparent,
          shadowColor: AppPallete.transparent
        ),
        child: Text(buttonText, style: const TextStyle(
          fontSize: 17.0,
          color: AppPallete.whiteColor,
          fontWeight: FontWeight.w600
        ),)
        ),
    );
  }
}