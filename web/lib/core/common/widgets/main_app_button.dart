import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

class MainAppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool startLoading;

  const MainAppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.startLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppPallete.errorColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 55),
            backgroundColor: AppPallete.transparent,
            shadowColor: AppPallete.transparent),
        child: startLoading
            ? _loading()
            : Text(
                buttonText,
                style: const TextStyle(
                  color: AppPallete.whiteColor,
                ),
              ),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.0,  // Define the width
            height: 30.0, // Define the height
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Loading Please Wait...")
        ],
      ),
    );
  }
}
