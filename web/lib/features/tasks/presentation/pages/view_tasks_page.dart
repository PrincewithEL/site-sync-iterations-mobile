import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:site_sync/features/tasks/presentation/pages/add_task_page.dart';
import 'package:site_sync/features/tasks/presentation/pages/view_task_details_page.dart';
import 'package:site_sync/features/tasks/presentation/pages/widgets/tasks_component.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/common/widgets/secondary_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';
import '../../../dashboard/presentation/widgets/empty_component.dart';
import '../../../dashboard/presentation/widgets/project_component.dart';

class ViewTasksPage extends StatefulWidget {
  static route(final String? projectId) => MaterialPageRoute(
        builder: (context) => ViewTasksPage(
          projectId: projectId,
        ),
      );

  final String? projectId;

  const ViewTasksPage({
    this.projectId,
    super.key,
  });

  @override
  State<ViewTasksPage> createState() => _ViewTasksPageState();
}

class _ViewTasksPageState extends State<ViewTasksPage> {
  @override
  void initState() {
    super.initState();
    context.read<TasksBloc>().add(ViewTask(projectId: widget.projectId ?? "0"));
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
          if (state is ViewTaskFailure) {
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
                  "View Tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Builder(
                    builder: (context) {
                      if (state is ViewTaskLoading) {
                        return const Center(
                          child: Loader(),
                        );
                      }

                      if (state is ViewTaskFailure) {
                        return const EmptyComponent(subject: "Task");
                      }

                      if (state is ViewTaskSuccess) {
                        final project = state.response.data ?? [];
                        if (project.isEmpty) {
                          return const EmptyComponent(subject: "Task");
                        }
                        return TaskComponent(
                          tasks: project,
                          onPressed: (task) {
                            Navigator.push(
                              context,
                              ViewTaskDetailsPage.route(
                                task,
                                onComplete: (taskId) =>
                                    context.read<TasksBloc>().add(
                                          CompleteTask(
                                            projectId: widget.projectId ?? "0",
                                            taskId: taskId,
                                          ),
                                        ),
                                onDelete: (taskId) =>
                                    context.read<TasksBloc>().add(
                                          DeleteTask(
                                            projectId: widget.projectId ?? "0",
                                            taskId: taskId,
                                          ),
                                        ),
                              ),
                            );
                          },
                        );
                      }
                      context.read<TasksBloc>().add(
                        ViewTask(
                          projectId: widget.projectId ?? "0",
                        ),
                      );
                      return const EmptyComponent(subject: "Task");
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: state is ViewTaskSuccess &&
                    state.userType.contains("Client"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SecondaryAppButton(
                      buttonText: "Add Task",
                      onPressed: () => Navigator.push(
                        context,
                        AddTaskPage.route(widget.projectId),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
