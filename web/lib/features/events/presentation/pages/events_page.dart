import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/events/presentation/bloc/events_bloc.dart';
import 'package:site_sync/features/events/presentation/pages/add_event_page.dart';
import 'package:site_sync/features/events/presentation/pages/widgets/events_component.dart';

import '../../../../core/common/widgets/secondary_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../dashboard/presentation/widgets/empty_component.dart';

class EventsPage extends StatefulWidget {
  static route(final String projectId) => MaterialPageRoute(
        builder: (context) => EventsPage(
          projectId: projectId,
        ),
      );

  final String projectId;

  const EventsPage({super.key, required this.projectId});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(
          EventsView(
            projectId: widget.projectId,
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
      body: BlocConsumer<EventsBloc, EventsState>(
        listener: (context, state) {
          if (state is DeleteEventSuccess) {
            context.read<EventsBloc>().add(
                  EventsView(
                    projectId: widget.projectId,
                  ),
                );
            showSnackBar(context, state.response);
          }
          if (state is DeleteEventFailure) {
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
                  "View Meetings",
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
                  child: Builder(builder: (context) {
                    if (state is EventsViewLoading ||
                        state is DeleteEventLoading) {
                      return const Loader();
                    }

                    if (state is EventsViewFailure) {
                      return const EmptyComponent(subject: "Meetings");
                    }

                    if (state is EventsViewSuccess) {
                      final events = state.response.data ?? [];
                      if (events.isEmpty) {
                        return const EmptyComponent(subject: "Task");
                      }
                      return ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppPallete.transparent,
                            child: EventDetailsPage(
                              isVisible: state.isVisible,
                              event: events[index],
                              onPressed: (eventId) =>
                                  context.read<EventsBloc>().add(
                                        DeleteEvent(
                                          projectId: widget.projectId,
                                          eventId: eventId,
                                        ),
                                      ),
                            ),
                          );
                        },
                      );
                    }
                    context.read<EventsBloc>().add(
                      EventsView(
                        projectId: widget.projectId,
                      ),
                    );
                    return const EmptyComponent(subject: "Meetings");
                  }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryAppButton(
                    buttonText: "Add Meeting",
                    onPressed: () => Navigator.push(
                      context,
                      AddEventPage.route(widget.projectId),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
