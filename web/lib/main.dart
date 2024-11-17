import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/theme/theme.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/chatroom/presentation/bloc/chatroom_bloc.dart';
import 'package:site_sync/features/dashboard/presentation/bloc/projects_details_bloc.dart';
import 'package:site_sync/features/events/presentation/bloc/events_bloc.dart';
import 'package:site_sync/features/project_details/presentation/bloc/create_project_bloc.dart';
import 'package:site_sync/features/resources/presentation/bloc/resource_bloc.dart';
import 'package:site_sync/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:site_sync/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:site_sync/init_dependencies.dart';

import 'features/onboarding/presentation/pages/onboarding_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencies();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<TasksBloc>()),
        BlocProvider(create: (_) => serviceLocator<ChatroomBloc>()),
        BlocProvider(create: (_) => serviceLocator<EventsBloc>()),
        BlocProvider(create: (_) => serviceLocator<TransactionsBloc>()),
        BlocProvider(create: (_) => serviceLocator<ResourceBloc>()),
        BlocProvider(create: (_) => serviceLocator<ProjectsDetailsBloc>()),
        BlocProvider(create: (_) => serviceLocator<CreateProjectBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site Sync',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const OnBoardingPage(),
    );
  }
}
