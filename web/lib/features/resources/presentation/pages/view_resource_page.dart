import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/resources/presentation/bloc/resource_bloc.dart';
import 'package:site_sync/features/resources/presentation/pages/add_resource_page.dart';
import 'package:site_sync/features/resources/presentation/pages/widgets/resource_details_card.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/common/widgets/secondary_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../dashboard/presentation/widgets/empty_component.dart';

class ViewResourcePage extends StatefulWidget {
  static route(final String? projectId) => MaterialPageRoute(
        builder: (context) => ViewResourcePage(
          projectId: projectId,
        ),
      );

  final String? projectId;

  const ViewResourcePage({
    super.key,
    this.projectId,
  });

  @override
  State<ViewResourcePage> createState() => _ViewResourcePageState();
}

class _ViewResourcePageState extends State<ViewResourcePage> {
  @override
  void initState() {
    context.read<ResourceBloc>().add(
          ViewResourceEvent(
            projectId: widget.projectId ?? "0",
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<ResourceBloc, ResourceState>(
        listener: (context, state) {
          if (state is DeleteResourceSuccess) {
            showSnackBar(
              context,
              state.response.message ?? "File Deleted Successfully",
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
                  "Project Files",
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
                      if (state is ViewResourceLoading ||
                          state is DeleteResourceLoading) {
                        return const Center(
                          child: Loader(),
                        );
                      }

                      if (state is ViewResourceFailure) {
                        return const EmptyComponent(subject: "Files");
                      }

                      if (state is ViewResourceSuccess) {
                        final resourceData = state.response.data ?? [];
                        if (resourceData.isEmpty) {
                          return const EmptyComponent(subject: "Files");
                        }
                        return ListView.builder(
                          itemCount: resourceData.length,
                          itemBuilder: (context, index) {
                            final file = resourceData[index];
                            return ResourceDetailCard(
                              resourceData: file,
                              onDelete: () {
                                context.read<ResourceBloc>().add(
                                      DeleteResourceEvent(
                                        projectId: widget.projectId.toString(),
                                        resourceId: file.resourceId.toString(),
                                      ),
                                    );
                              },
                            );
                          },
                        );
                      }
                      context.read<ResourceBloc>().add(
                            ViewResourceEvent(
                              projectId: widget.projectId ?? "0",
                            ),
                          );
                      return const EmptyComponent(subject: "Files");
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SecondaryAppButton(
                buttonText: "Add File",
                onPressed: () => Navigator.push(
                  context,
                  AddResourcePage.route(
                    widget.projectId.toString(),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
