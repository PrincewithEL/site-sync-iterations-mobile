import 'package:flutter/material.dart';

import '../../../domain/entities/view_tasks_entity.dart';

class TaskComponent extends StatelessWidget {
  final List<TaskDataEntity> tasks;
  final Function(TaskDataEntity) onPressed;

  const TaskComponent({
    super.key,
    required this.tasks,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    TaskDataEntity? task;
    return GestureDetector(
      onTap: () {
        onPressed(task!);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            task = tasks[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task!.taskName!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 4),
                        Text("Due Date: ${task!.dueDate}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.hourglass_bottom, size: 16),
                        const SizedBox(width: 4),
                        Text("Countdown: ${task!.countdown} days"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          task!.status == "Ongoing"
                              ? Icons.autorenew
                              : Icons.check_circle,
                          color: task!.status == "Ongoing"
                              ? Colors.orange
                              : Colors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text("Status: ${task!.status}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (task!.assignedTo!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.person, size: 16),
                          const SizedBox(width: 4),
                          Text("Assigned to: ${task!.assignedTo?.join(', ')}"),
                        ],
                      )
                    else
                      const Text("No one assigned",
                          style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
