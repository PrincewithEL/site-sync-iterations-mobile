import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/resources/presentation/bloc/resource_bloc.dart';
import 'package:site_sync/features/tasks/presentation/pages/view_tasks_page.dart';

import '../../../../core/common/widgets/file_picker_field.dart';
import '../../../../core/common/widgets/input_field.dart';
import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class AddResourcePage extends StatefulWidget {
  static route(final String? projectId) => MaterialPageRoute(
        builder: (context) => AddResourcePage(
          projectId: projectId,
        ),
      );

  final String? projectId;

  const AddResourcePage({
    super.key,
    this.projectId,
  });

  @override
  State<AddResourcePage> createState() => _AddResourcePageState();
}

class _AddResourcePageState extends State<AddResourcePage> {
  final _resourceNameController = TextEditingController();
  final _resourceDetailController = TextEditingController();
  final _resourceFileController = TextEditingController();
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
        child: BlocConsumer<ResourceBloc, ResourceState>(
          listener: (context, state) {
            if (state is AddResourceFailure) {
              showSnackBar(context, state.message);
            }
            if (state is AddResourceSuccess) {
              showSnackBar(context, state.response.message ?? "Success");
              Navigator.of(context).pop(false);
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
                    "Add Resource",
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
                          hintText: 'Resource Name',
                          controller: _resourceNameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Resource Details',
                          controller: _resourceDetailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FilePickerInput(
                          controller: _resourceFileController,
                          hint: 'Select a document',
                          onFileSelected: (file) {
                            print('Selected file: ${file.name}');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainAppButton(
                          buttonText: 'Add Resource',
                          startLoading: state is AddResourceLoading,
                          onPressed: () {
                            // context.read<ResourceBloc>().add();
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
