import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/features/tasks/domain/entities/view_tasks_entity.dart';
import 'package:site_sync/features/tasks/domain/usecases/add_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/complete_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/delete_task.dart';
import 'package:site_sync/features/tasks/domain/usecases/view_tasks.dart';

import '../../../../core/services/local_storage/secure_storage.dart';
import '../../../../core/utils/constants.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUseCase _addTaskUseCase;
  final ViewTasksUseCase _viewTasksUseCase;
  final CompleteTaskUseCase _completeTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TasksBloc(
    AddTaskUseCase addTaskUseCase,
    ViewTasksUseCase viewTasksUseCase,
    CompleteTaskUseCase completeTaskUseCase,
    DeleteTaskUseCase deleteTaskUseCase,
  )   : _addTaskUseCase = addTaskUseCase,
        _viewTasksUseCase = viewTasksUseCase,
        _deleteTaskUseCase = deleteTaskUseCase,
        _completeTaskUseCase = completeTaskUseCase,
        super(TasksInitial()) {
    on<ViewTask>(_onViewTask);
    on<AddTask>(_onAddTask);
    on<CompleteTask>(_onCompleteTask);
    on<DeleteTask>(_onDeleteTask);
  }

  _onViewTask(ViewTask event, Emitter<TasksState> emit) async {
    emit(ViewTaskLoading());
    final userType = await SecureStorage().getCredentials(userTypeId) ?? "";
    final response = await _viewTasksUseCase(event.projectId);
    response.fold((error) {
      emit(ViewTaskFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(ViewTaskSuccess(
        response: response,
        userType: userType,
      ));
    });
  }

  _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    emit(AddTaskLoading());
    final response = await _addTaskUseCase(
      AddTaskParam(
        event.taskName,
        event.projectId,
        event.taskDetails,
        event.dueDate,
        event.transactionPrice,
        event.members,
        event.dependentTask,
      ),
    );
    response.fold((error) {
      emit(AddTaskFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(AddTaskSuccess(response: response.message!));
    });
  }

  _onCompleteTask(CompleteTask event, Emitter<TasksState> emit) async {
    emit(CompleteTaskLoading());
    final response = await _completeTaskUseCase(
      CompleteTaskParam(
        event.taskId,
        event.projectId,
      ),
    );
    response.fold((error) {
      emit(CompleteTaskFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(CompleteTaskSuccess(response: response.message ?? "Success"));
    });
  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    emit(DeleteTaskLoading());
    final response = await _deleteTaskUseCase(
      DeleteTaskParam(
        event.taskId,
        event.projectId,
      ),
    );
    response.fold((error) {
      emit(DeleteTaskFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(DeleteTaskSuccess(response: response.message ?? "Success"));
    });
  }
}
