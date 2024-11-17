import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

void showSnackBar(BuildContext context, final String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}

void showSnackBarWithButton(
  BuildContext context, {
  required final String content,
  required final String label,
  required final VoidCallback onPressed,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(
          label: label,
          onPressed: onPressed,
          textColor: AppPallete.whiteColor,
          backgroundColor: AppPallete.backgroundColor,
        ),
        duration: const Duration(
          seconds: 120,
        ),
      ),
    );
}

