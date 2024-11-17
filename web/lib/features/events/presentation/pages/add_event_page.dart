import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/time_picker_field.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/events/presentation/bloc/events_bloc.dart';

import '../../../../core/common/widgets/date_picker_field.dart';
import '../../../../core/common/widgets/input_field.dart';
import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';

class AddEventPage extends StatefulWidget {
  static route(final String? projectId) => MaterialPageRoute(
        builder: (context) => AddEventPage(
          projectId: projectId,
        ),
      );

  final String? projectId;

  const AddEventPage({super.key, this.projectId});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _eventNameController = TextEditingController();
  final _eventDetailController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventStartTimeController = TextEditingController();
  final _eventEndTimeController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _eventLinkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                  "Add Meeting",
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
              BlocConsumer<EventsBloc, EventsState>(
                listener: (context, state) {
                  if (state is AddEventSuccess) {
                    showSnackBar(context, state.response);
                    Navigator.of(context).pop();
                  }
          
                  if (state is AddEventFailure) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        InputField(
                          hintText: 'Meeting Name',
                          controller: _eventNameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Meeting Details',
                          controller: _eventDetailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DatePickerInput(
                          hint: "Meeting date",
                          controller: _eventDateController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TimePickerInput(
                          hint: 'Meeting Start Time',
                          controller: _eventStartTimeController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TimePickerInput(
                          hint: 'Meeting End Time',
                          controller: _eventEndTimeController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Meeting Location',
                          controller: _eventLocationController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Meeting Link',
                          controller: _eventLinkController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainAppButton(
                          buttonText: 'Add Meeting',
                          startLoading: state is AddEventLoading,
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              context.read<EventsBloc>().add(
                                AddEvent(
                                  projectId: widget.projectId ?? "0",
                                  eventName: _eventNameController.text.trim(),
                                  eventDetails:
                                  _eventDetailController.text.trim(),
                                  eventDate: _eventDateController.text.trim(),
                                  eventStartTime:
                                  _eventStartTimeController.text.trim(),
                                  eventEndTime:
                                  _eventEndTimeController.text.trim(),
                                  eventLocation:
                                  _eventLocationController.text.trim(),
                                  eventLink: _eventLinkController.text.trim(),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
