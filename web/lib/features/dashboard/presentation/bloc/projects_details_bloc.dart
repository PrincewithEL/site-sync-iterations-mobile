import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/features/dashboard/domain/entities/projects_details_entity.dart';
import 'package:site_sync/features/dashboard/domain/usecase/projects_details.dart';

part 'projects_details_event.dart';

part 'projects_details_state.dart';

class ProjectsDetailsBloc
    extends Bloc<ProjectsDetailsEvent, ProjectsDetailsState> {
  final ProjectsDetailsUseCase _projectsDetailsUseCase;

  ProjectsDetailsBloc({
    required ProjectsDetailsUseCase projectsDetailsUseCase,
  })  : _projectsDetailsUseCase = projectsDetailsUseCase,
        super(ProjectsDetailsInitial()) {
    on<LoadProjectsDetails>(_onProjectsDetails);
    add(LoadProjectsDetails());
  }

  void _onProjectsDetails(
    LoadProjectsDetails event,
    Emitter<ProjectsDetailsState> emit,
  ) async {
    emit(ProjectsDetailsLoading());
    final response = await _projectsDetailsUseCase("");
    response.fold(
      (failure) => emit(
        ProjectsDetailsFailure(
          message:
              failure.siteSyncError.message ?? "Error getting your projects",
        ),
      ),
      (response) => emit(
        ProjectsDetailsSuccess(
          response: response,
        ),
      ),
    );
  }
}
