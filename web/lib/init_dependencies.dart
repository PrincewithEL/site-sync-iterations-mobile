import 'package:get_it/get_it.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/services/network/network_info/network_info.dart';
import 'package:site_sync/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:site_sync/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:site_sync/features/auth/domain/repository/auth_repository.dart';
import 'package:site_sync/features/auth/domain/usecases/complete_profile.dart';
import 'package:site_sync/features/auth/domain/usecases/reset_password.dart';
import 'package:site_sync/features/auth/domain/usecases/user_sign_in.dart';
import 'package:site_sync/features/auth/domain/usecases/user_sign_up.dart';
import 'package:site_sync/features/auth/domain/usecases/verify_otp_code.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/chatroom/data/datasource/chatroom_remote_datasource.dart';
import 'package:site_sync/features/chatroom/data/repository/chatroom_repository_impl.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';
import 'package:site_sync/features/chatroom/domain/usecases/delete_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/edit_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/search_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/send_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/view_chatroom.dart';
import 'package:site_sync/features/chatroom/presentation/bloc/chatroom_bloc.dart';
import 'package:site_sync/features/dashboard/data/datasource/project_details_remote_source.dart';
import 'package:site_sync/features/dashboard/data/repository/project_details_repository_impl.dart';
import 'package:site_sync/features/dashboard/domain/repository/project_details_repository.dart';
import 'package:site_sync/features/dashboard/domain/usecase/projects_details.dart';
import 'package:site_sync/features/dashboard/presentation/bloc/projects_details_bloc.dart';
import 'package:site_sync/features/events/data/datasource/event_remote_datasource.dart';
import 'package:site_sync/features/events/data/repository/events_respository_impl.dart';
import 'package:site_sync/features/events/domain/repository/event_repository.dart';
import 'package:site_sync/features/events/domain/usecase/add_events.dart';
import 'package:site_sync/features/events/domain/usecase/all_events.dart';
import 'package:site_sync/features/events/domain/usecase/delete_events.dart';
import 'package:site_sync/features/events/presentation/bloc/events_bloc.dart';
import 'package:site_sync/features/project_details/data/datasources/create_project_remote_datasource.dart';
import 'package:site_sync/features/project_details/data/repository/create_project_repository_impl.dart';
import 'package:site_sync/features/project_details/domain/repository/create_project_repository.dart';
import 'package:site_sync/features/project_details/domain/usecases/create_project.dart';
import 'package:site_sync/features/project_details/domain/usecases/leave_project.dart';
import 'package:site_sync/features/project_details/presentation/bloc/create_project_bloc.dart';
import 'package:site_sync/features/resources/data/datasource/resource_remote_datasource.dart';
import 'package:site_sync/features/resources/data/repository/resource_repository_impl.dart';
import 'package:site_sync/features/resources/domain/repository/resource_repository.dart';
import 'package:site_sync/features/resources/domain/usecases/add_resource.dart';
import 'package:site_sync/features/resources/domain/usecases/delete_resource.dart';
import 'package:site_sync/features/resources/domain/usecases/view_resource.dart';
import 'package:site_sync/features/resources/presentation/bloc/resource_bloc.dart';
import 'package:site_sync/features/tasks/data/datasource/tasks_remote_datasource.dart';
import 'package:site_sync/features/tasks/data/repository/task_repository_impl.dart';
import 'package:site_sync/features/tasks/domain/repository/tasks_repository.dart';
import 'package:site_sync/features/tasks/domain/usecases/add_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/complete_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/delete_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/view_tasks.dart';
import 'package:site_sync/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:site_sync/features/transactions/data/datasource/transaction_remote_datasource.dart';
import 'package:site_sync/features/transactions/data/respository/transaction_repository_impl.dart';
import 'package:site_sync/features/transactions/domain/repository/transaction_repository.dart';
import 'package:site_sync/features/transactions/domain/usecases/add_transactions.dart';
import 'package:site_sync/features/transactions/domain/usecases/delete_transactions.dart';
import 'package:site_sync/features/transactions/domain/usecases/view_transactions.dart';
import 'package:site_sync/features/transactions/presentation/bloc/transactions_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  _initAuth();
  _initProjectTasks();
  _initChatRoom();
  _initProjectsDetails();
  _initCreateProjects();
  _initProjectEvents();
  _initProjectResource();
  _initProjectTransactions();
  final ApiService apiService = ApiService();
  serviceLocator.registerLazySingleton(() => apiService);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SignUpUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CompleteProfileUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SignInUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ResetPasswordUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => VerifyOtpCodeUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        signUpUseCase: serviceLocator(),
        completeProfileUseCase: serviceLocator(),
        signInUseCase: serviceLocator(),
        resetPasswordUseCase: serviceLocator(),
        verifyOTPUseCase: serviceLocator(),
      ),
    );
}

void _initProjectsDetails() {
  serviceLocator
    ..registerFactory<ProjectDetailsRemoteSource>(
      () => ProjectDetailsRemoteSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<ProjectDetailsRepository>(
      () => ProjectDetailsRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ProjectsDetailsUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ProjectsDetailsBloc(
        projectsDetailsUseCase: serviceLocator(),
      ),
    );
}

void _initCreateProjects() {
  serviceLocator
    ..registerFactory<CreateProjectRemoteDataSource>(
      () => CreateProjectRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<CreateProjectRepository>(
      () => CreateProjectRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CreateProjectUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LeaveProjectUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => CreateProjectBloc(
        createProjectUseCase: serviceLocator(),
        leaveProjectUseCase: serviceLocator(),
      ),
    );
}

void _initProjectTasks() {
  serviceLocator
    ..registerFactory<TasksRemoteDataSource>(
      () => TasksRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<TasksRepository>(
      () => TaskRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddTaskUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewTasksUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CompleteTaskUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteTaskUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => TasksBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initProjectTransactions() {
  serviceLocator
    ..registerFactory<TransactionRemoteDatasource>(
      () => TransactionRemoteDatasourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<TransactionRepository>(
      () => TransactionRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddTransactionUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewTransactionUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteTransactionUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => TransactionsBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initProjectResource() {
  serviceLocator
    ..registerFactory<ResourceRemoteDataSource>(
      () => ResourceRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<ResourceRepository>(
      () => ResourceRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewResourceUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddResourceUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteResourceUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ResourceBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initChatRoom() {
  serviceLocator
    ..registerFactory<ChatroomRemoteDataSource>(
      () => ChatroomRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<ChatRoomRepository>(
      () => ChatroomRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewChatroomUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SendMessageUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchMessagesUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteMessageUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => EditMessageUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ChatroomBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initProjectEvents() {
  serviceLocator
    ..registerFactory<EventsRemoteDataSource>(
      () => EventsRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<EventsRepository>(
      () => EventsRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddEventsUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewEventsUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteEventsUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => EventsBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}
