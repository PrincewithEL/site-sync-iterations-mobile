import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:site_sync/features/tasks/presentation/pages/view_tasks_page.dart';

import '../../../../core/common/widgets/date_picker_field.dart';
import '../../../../core/common/widgets/input_field.dart';
import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class AddTaskPage extends StatefulWidget {
  static route(final String? projectId) => MaterialPageRoute(
        builder: (context) => AddTaskPage(
          projectId: projectId,
        ),
      );

  final String? projectId;

  const AddTaskPage({
    super.key,
    this.projectId,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _taskNameController = TextEditingController();
  final _taskDetailController = TextEditingController();
  final _taskDueDateController = TextEditingController();
  final _taskTransactionPriceController = TextEditingController();
  final _taskMemberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<TasksBloc, TasksState>(
          listener: (context, state) {
            if (state is AddTaskFailure) {
              showSnackBar(context, state.message);
            }
            if (state is AddTaskSuccess) {
              showSnackBar(context, state.response);
              Navigator.push(
                context,
                ViewTasksPage.route(widget.projectId),
              );
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
                    "Add Task",
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputField(
                          hintText: 'Task Name',
                          controller: _taskNameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Task Details',
                          controller: _taskDetailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DatePickerInput(
                          hint: "Task Due date",
                          controller: _taskDueDateController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Task Transaction Price',
                          controller: _taskTransactionPriceController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Members',
                          controller: _taskMemberController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainAppButton(
                          buttonText: 'Save Task',
                          startLoading: state is AddTaskLoading,
                          onPressed: () {
                            context.read<TasksBloc>().add(
                                  AddTask(
                                    projectId: widget.projectId ?? "0",
                                    taskName: _taskNameController.text.trim(),
                                    taskDetails:
                                        _taskDetailController.text.trim(),
                                    dueDate: _taskDueDateController.text.trim(),
                                    transactionPrice:
                                        _taskTransactionPriceController.text
                                            .trim(),
                                    members: [
                                      int.parse(_taskMemberController.text)
                                    ],
                                    dependentTask: "null",
                                  ),
                                );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
