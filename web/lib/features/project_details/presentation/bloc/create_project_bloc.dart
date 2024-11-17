import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/features/project_details/domain/usecases/create_project.dart';
import 'package:site_sync/features/project_details/domain/usecases/leave_project.dart';

part 'create_project_event.dart';

part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  final LeaveProjectUseCase _leaveProjectUseCase;

  CreateProjectBloc({
    required CreateProjectUseCase createProjectUseCase,
    required LeaveProjectUseCase leaveProjectUseCase,
  })  : _createProjectUseCase = createProjectUseCase,
        _leaveProjectUseCase = leaveProjectUseCase,
        super(CreateProjectInitial()) {
    on<CreateProject>(_onCreateProject);
    on<LeaveProject>(_onLeaveProject);
  }

  void _onCreateProject(
    final CreateProject event,
    Emitter<CreateProjectState> emit,
  ) async {
    emit(CreateProjectLoading());
    final response = await _createProjectUseCase(
      CreateProjectParam(
        event.startDate,
        event.endDate,
        event.estimatedBudget,
        event.projectDetails,
        event.projectImage,
        event.projectName,
      ),
    );
    response.fold(
      (failure) => emit(
        CreateProjectFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        CreateProjectSuccess(
          response: response,
        ),
      ),
    );
  }

  void _onLeaveProject(
    final LeaveProject event,
    Emitter<CreateProjectState> emit,
  ) async {
    emit(LeaveProjectLoading());
    final response = await _leaveProjectUseCase(
      LeaveProjectParam(
        event.projectId,
      ),
    );
    response.fold(
      (failure) => emit(
        LeaveProjectFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        LeaveProjectSuccess(
          response: response.message ?? "Success",
        ),
      ),
    );
  }
}
