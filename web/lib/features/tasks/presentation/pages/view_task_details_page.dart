import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/tasks/domain/entities/view_tasks_entity.dart';
import 'package:site_sync/features/tasks/presentation/bloc/tasks_bloc.dart';

import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class ViewTaskDetailsPage extends StatefulWidget {
  static route(
    final TaskDataEntity taskEntity, {
    required Function(String) onComplete,
    required Function(String) onDelete,
  }) =>
      MaterialPageRoute(
        builder: (context) => ViewTaskDetailsPage(
          taskDataEntity: taskEntity,
          onComplete: onComplete,
          onDelete: onDelete,
        ),
      );

  final TaskDataEntity taskDataEntity;
  final Function(String) onComplete;
  final Function(String) onDelete;

  const ViewTaskDetailsPage({
    super.key,
    required this.taskDataEntity,
    required this.onComplete,
    required this.onDelete,
  });

  @override
  State<ViewTaskDetailsPage> createState() => _ViewTaskDetailsPageState();
}

class _ViewTaskDetailsPageState extends State<ViewTaskDetailsPage> {
  void _showOptionsModal(
    BuildContext context,
    String title,
    IconData iconData,
    VoidCallback onPressed,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppPallete.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Are you sure you want to $title"),
            ),
            ListTile(
              leading: const Icon(Icons.cancel, color: AppPallete.whiteColor),
              title: const Text(
                'Cancel',
                style: TextStyle(color: AppPallete.whiteColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(iconData, color: Colors.red),
              title: Text(
                title,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<TasksBloc, TasksState>(
        listener: (context, state) {
          if (state is CompleteTaskSuccess) {
            if(!mounted) return;
            Navigator.pop(context);
            showSnackBar(context, state.response);
            Navigator.pop(context);
          }

          if (state is DeleteTaskSuccess) {
            if(!mounted) return;
            Navigator.pop(context);
            showSnackBar(context, state.response);
            Navigator.pop(context);
          }

          if (state is DeleteTaskFailure) {
            showSnackBar(context, state.message);
          }

          if (state is CompleteTaskFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppPallete.errorColor,
                ),
                child: const Text(
                  "Task Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    bottom: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetailRow(
                                  "Task Name",
                                  widget.taskDataEntity.taskName!,
                                ),
                                _buildDetailRow(
                                  "Due Date",
                                  widget.taskDataEntity.dueDate!,
                                ),
                                _buildDetailRow(
                                  "Status",
                                  widget.taskDataEntity.status!,
                                ),
                                _buildDetailRow(
                                  "Assigned To: ",
                                  widget.taskDataEntity.assignedTo!.isNotEmpty
                                      ? widget.taskDataEntity.assignedTo![0]
                                      : "None",
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: MainAppButton(
                                        buttonText: 'Complete Task',
                                        startLoading: false,
                                        onPressed: () => _showOptionsModal(
                                          context,
                                          "Complete Task",
                                          Icons.check,
                                          () => widget.onComplete(
                                            widget.taskDataEntity.taskId
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: MainAppButton(
                                        buttonText: 'Delete Task',
                                        startLoading: false,
                                        onPressed: () => _showOptionsModal(
                                          context,
                                          "Delete Task",
                                          Icons.delete,
                                          () => widget.onDelete(
                                            widget.taskDataEntity.taskId
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
