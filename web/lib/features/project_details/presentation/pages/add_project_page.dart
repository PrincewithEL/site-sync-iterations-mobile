import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/date_picker_field.dart';
import 'package:site_sync/core/common/widgets/image_picker_field.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/project_details/presentation/bloc/create_project_bloc.dart';
import 'package:site_sync/features/project_details/presentation/bloc/create_project_bloc.dart';

import '../../../../core/common/widgets/input_field.dart';
import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';

class AddProjectPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddProjectPage());

  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final _projectNameController = TextEditingController();
  final _projectImageController = TextEditingController();
  final _projectStartDateController = TextEditingController();
  final _projectEndDateController = TextEditingController();
  final _projectEstimatedBudgetController = TextEditingController();
  final _projectDetailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _projectNameController.dispose();
    _projectImageController.dispose();
    _projectStartDateController.dispose();
    _projectEndDateController.dispose();
    _projectEstimatedBudgetController.dispose();
    _projectDetailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<CreateProjectBloc, CreateProjectState>(
          listener: (context, state) {
            if (state is CreateProjectFailure) {
              showSnackBar(context, state.message);
            }

            if (state is CreateProjectSuccess) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
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
                      "Add Project",
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
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InputField(
                            hintText: 'Project Name',
                            controller: _projectNameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ImagePickerInput(
                            hint: "Select project image",
                            controller: _projectImageController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DatePickerInput(
                            hint: "Project Start date",
                            controller: _projectStartDateController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DatePickerInput(
                            hint: "Project End date",
                            controller: _projectEndDateController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                            hintText: 'Estimated Budget',
                            controller: _projectEstimatedBudgetController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                            hintText: 'Project Details',
                            controller: _projectDetailsController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MainAppButton(
                            buttonText: 'Create Project',
                            startLoading: state is CreateProjectLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<CreateProjectBloc>().add(
                                      CreateProject(
                                        _projectStartDateController.text.trim(),
                                        _projectEndDateController.text.trim(),
                                        _projectEstimatedBudgetController.text
                                            .trim(),
                                        _projectDetailsController.text.trim(),
                                        _projectImageController.text.trim(),
                                        _projectNameController.text.trim(),
                                      ),
                                    );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
