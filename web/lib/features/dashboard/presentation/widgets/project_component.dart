import 'package:flutter/material.dart';

class ProjectComponent extends StatelessWidget {
  final Color mainColor;
  final String projectName;
  final String chatCount;
  final String eventCount;
  final double progress;
  final VoidCallback onPressed;

  const ProjectComponent({
    super.key,
    required this.mainColor,
    required this.projectName,
    required this.chatCount,
    required this.eventCount,
    required this.progress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                projectName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildIconWithNumber(Icons.task, eventCount),
              _buildIconWithNumber(Icons.chat, chatCount),
              _buildProgressBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithNumber(IconData icon, String number) {
    return Row(
      children: [
        Icon(icon, size: 30),
        const SizedBox(width: 2),
        Text(
          number,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      width: 100,
      child: LinearProgressIndicator(
        value: progress / 100,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
        minHeight: 8,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
