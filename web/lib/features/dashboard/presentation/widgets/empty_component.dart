import 'package:flutter/material.dart';

class EmptyComponent extends StatelessWidget {
  final String subject;

  const EmptyComponent({
    super.key,
    this.subject = "projects",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.hourglass_empty,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            "No $subject Found",
          ),
          const SizedBox(height: 8),
          Text(
            "Add some $subject to get started",
          ),
        ],
      ),
    );
  }
}
