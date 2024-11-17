import 'package:flutter/material.dart';
import 'package:site_sync/core/images/app_images.dart';

import '../../../core/theme/app_pallete.dart';

class SecondaryAppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const SecondaryAppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppPallete.backgroundColor,
          border: Border.all(
            color: AppPallete.errorColor, // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 1),
            backgroundColor: AppPallete.transparent,
            shadowColor: AppPallete.transparent,
            elevation: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: AppPallete.whiteColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}
