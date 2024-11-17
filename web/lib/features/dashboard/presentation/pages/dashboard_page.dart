import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';
import 'package:site_sync/features/dashboard/presentation/bloc/projects_details_bloc.dart';
import 'package:site_sync/features/dashboard/presentation/widgets/empty_component.dart';
import 'package:site_sync/features/project_details/presentation/pages/add_project_page.dart';
import 'package:site_sync/features/chatroom/presentation/pages/chatroom_page.dart';
import 'package:site_sync/features/profile/presentation/pages/profile_page.dart';
import 'package:site_sync/features/project_details/presentation/pages/project_details.dart';
import 'package:site_sync/features/dashboard/presentation/widgets/project_component.dart';

import '../../../../core/common/widgets/secondary_app_button.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class MainDashboardPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MainDashboardPage());

  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectsDetailsBloc>().add(LoadProjectsDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppPallete.errorColor,
              ),
              child: Text(
                'Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MyProfilePage.route());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: BlocConsumer<ProjectsDetailsBloc, ProjectsDetailsState>(
        listener: (context, state) {
          if (state is ProjectsDetailsFailure) {
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
                  "Dashboard",
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
              const Text(
                "My Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Expanded(
                child: SizedBox(
                    height: double.infinity,
                    child: Builder(builder: (context) {
                      if (state is ProjectsDetailsLoading) {
                        return const Center(
                          child: Loader(),
                        );
                      }

                      if (state is ProjectsDetailsFailure) {
                        return const EmptyComponent();
                      }

                      if (state is ProjectsDetailsSuccess) {
                        final projects = state.response.data?.allProjects ?? [];

                        if (projects.isEmpty) {
                          return const EmptyComponent();
                        }

                        return ListView.separated(
                          itemCount: projects.length,
                          separatorBuilder: (context, index) => const Divider(
                            indent: 20,
                            endIndent: 20,
                          ),
                          itemBuilder: (context, index) {
                            return ProjectComponent(
                              mainColor: AppPallete.borderColor,
                              projectName: projects[index].projectName!,
                              chatCount: projects[index].chats.toString(),
                              eventCount: projects[index].tasks.toString(),
                              progress: double.parse(
                                projects[index].projectpercentage!.toString(),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                ProjectDetails.route(
                                  projects[index],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const EmptyComponent();
                    })),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryAppButton(
                    buttonText: "Add Project",
                    onPressed: () => Navigator.push(
                      context,
                      AddProjectPage.route(),
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
