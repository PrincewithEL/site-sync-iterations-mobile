import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/features/resources/domain/entity/add_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/delete_resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';
import 'package:site_sync/features/resources/domain/usecases/add_resource.dart';
import 'package:site_sync/features/resources/domain/usecases/delete_resource.dart';
import 'package:site_sync/features/resources/domain/usecases/view_resource.dart';

part 'resource_event.dart';

part 'resource_state.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState> {
  final ViewResourceUseCase _viewResourceUseCase;
  final AddResourceUseCase _addResourceUseCase;
  final DeleteResourceUseCase _deleteResourceUseCase;

  ResourceBloc(
    ViewResourceUseCase viewResourceUseCase,
    AddResourceUseCase addResourceUseCase,
    DeleteResourceUseCase deleteResourceUseCase,
  )   : _viewResourceUseCase = viewResourceUseCase,
        _addResourceUseCase = addResourceUseCase,
        _deleteResourceUseCase = deleteResourceUseCase,
        super(ResourceInitial()) {
    on<ViewResourceEvent>(_onViewResource);
    on<AddResourceEvent>(_onAddResource);
    on<DeleteResourceEvent>(_onDeleteResource);
  }

  void _onAddResource(
    final AddResourceEvent event,
    Emitter<ResourceState> emit,
  ) async {
    emit(AddResourceLoading());
    final response = await _addResourceUseCase(
      AddResourceParam(
        projectId: event.projectId,
        resourceName: event.resourceName,
        resourceDetails: event.resourceDetails,
        resourceFile: event.resourceFile,
      ),
    );
    response.fold(
      (failure) => emit(
        AddResourceFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        AddResourceSuccess(
          response: response,
        ),
      ),
    );
  }

  void _onDeleteResource(
    final DeleteResourceEvent event,
    Emitter<ResourceState> emit,
  ) async {
    emit(DeleteResourceLoading());
    final response = await _deleteResourceUseCase(
      DeleteResourceParam(
        projectId: event.projectId,
        resourceId: event.resourceId,
      ),
    );
    response.fold(
      (failure) => emit(
        DeleteResourceFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        DeleteResourceSuccess(
          response: response,
        ),
      ),
    );
  }

  void _onViewResource(
    final ViewResourceEvent event,
    Emitter<ResourceState> emit,
  ) async {
    emit(ViewResourceLoading());
    final response = await _viewResourceUseCase(event.projectId);
    response.fold(
      (failure) => emit(
        ViewResourceFailure(
          message: failure.siteSyncError.message ?? "Unexpected error occurred",
        ),
      ),
      (response) => emit(
        ViewResourceSuccess(
          response: response,
        ),
      ),
    );
  }
}
