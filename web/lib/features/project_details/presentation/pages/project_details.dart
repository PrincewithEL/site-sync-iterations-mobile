import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:site_sync/core/common/widgets/secondary_icon_button.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/chatroom/presentation/pages/chatroom_page.dart';
import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';
import 'package:site_sync/features/resources/presentation/pages/add_resource_page.dart';
import 'package:site_sync/features/resources/presentation/pages/view_resource_page.dart';
import 'package:site_sync/features/tasks/presentation/pages/view_tasks_page.dart';
import 'package:site_sync/features/transactions/presentation/pages/transactions_page.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../events/presentation/pages/events_page.dart';

class ProjectDetails extends StatefulWidget {
  static route(final ProjectsDataEntity projectData) => MaterialPageRoute(
        builder: (context) => ProjectDetails(
          projectData: projectData,
        ),
      );

  final ProjectsDataEntity projectData;

  const ProjectDetails({super.key, required this.projectData});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  late bool isVisible = false;

  void userType() async {
    final userType = await SecureStorage().getCredentials(userTypeId);
    setState(() {
      isVisible = userType == "Client" ? true : false;
    });
  }

  @override
  void initState() {
    super.initState();
    userType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
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
                "Project Details",
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
                                "Start Date",
                                widget.projectData.startDate!,
                              ),
                              _buildDetailRow(
                                "End Date",
                                widget.projectData.endDate!,
                              ),
                              _buildDetailRow(
                                "Budget (in Ksh.)",
                                "Ksh. ${widget.projectData.estimatedBudget?.toStringAsFixed(2)}",
                              ),
                              _buildDetailRow(
                                "Chats",
                                widget.projectData.chats.toString(),
                              ),
                              _buildDetailRow(
                                "Tasks",
                                widget.projectData.tasks.toString(),
                              ),
                              _buildDetailRow(
                                "Completion",
                                "${widget.projectData.projectpercentage}%",
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              _buildProgressIndicator(
                                double.parse(
                                  widget.projectData.projectpercentage
                                      .toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SecondaryIconButton(
                          text: "Chats",
                          iconData: Icons.chat,
                          onPressed: () {
                            Navigator.push(
                              context,
                              ChatRoomPage.route(
                                widget.projectData.projectId.toString(),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: SecondaryIconButton(
                        text: "Tasks",
                        iconData: Icons.task,
                        onPressed: () => Navigator.push(
                          context,
                          ViewTasksPage.route(
                            widget.projectData.projectId.toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: SecondaryIconButton(
                        text: "Meetings",
                        iconData: Icons.calendar_month,
                        onPressed: () => Navigator.push(
                          context,
                          EventsPage.route(
                            widget.projectData.projectId.toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Expanded(
                        flex: 1,
                        child: SecondaryIconButton(
                          text: "Transactions",
                          iconData: Icons.money,
                          onPressed: () => Navigator.push(
                            context,
                            TransactionsPage.route(
                                widget.projectData.projectId.toString()),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: SecondaryIconButton(
                        text: "Files",
                        iconData: Icons.file_present_sharp,
                        onPressed: () => Navigator.push(
                          context,
                          ViewResourcePage.route(
                              widget.projectData.projectId.toString()),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
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

  Widget _buildProgressIndicator(double percentage) {
    return Column(
      children: [
        const Text(
          "Project Completion",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 10),
        Text(
          "$percentage% Completed",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
