import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/chatroom/domain/entities/chatroom_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/send_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/usecases/delete_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/edit_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/search_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/send_message.dart';
import 'package:site_sync/features/chatroom/domain/usecases/view_chatroom.dart';

import '../../../../core/services/local_storage/secure_storage.dart';
import '../../domain/entities/edit_message_response_entity.dart';
import '../../domain/entities/search_message_response_entity.dart';

part 'chatroom_event.dart';

part 'chatroom_state.dart';

class ChatroomBloc extends Bloc<ChatroomEvent, ChatroomState> {
  final ViewChatroomUseCase _chatroomUseCase;
  final EditMessageUseCase _editMessageUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final SearchMessagesUseCase _searchMessagesUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;

  ChatroomBloc(
    ViewChatroomUseCase viewChatroomUseCase,
    EditMessageUseCase editMessageUseCase,
    SendMessageUseCase sendMessageUseCase,
    SearchMessagesUseCase searchMessageUseCase,
    DeleteMessageUseCase deleteMessageUseCase,
  )   : _chatroomUseCase = viewChatroomUseCase,
        _editMessageUseCase = editMessageUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        _searchMessagesUseCase = searchMessageUseCase,
        _deleteMessageUseCase = deleteMessageUseCase,
        super(ChatroomInitial()) {
    on<ViewChatroom>(_onViewChatroom);
    on<ViewPollingChatroom>(_onViewPollingChatroom);
    on<UpdateChatMessages>(_onUpdateChatMessages);
    on<SendMessage>(_onSendMessage);
    on<SearchMessage>(_onSearchMessage);
    on<EditMessage>(_onEditMessage);
    on<DeleteMessage>(_onDeleteMessage);
  }

  _onViewChatroom(ViewChatroom event, Emitter<ChatroomState> emit) async {
    emit(ViewChatroomLoading());
    final currentUserId = await SecureStorage().getCredentials(userIdKey);
    final response = await _chatroomUseCase(event.projectId);
    response.fold((error) {
      emit(ViewChatroomFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(
        ViewChatroomSuccess(
          currentUserId: currentUserId!,
          response: response,
        ),
      );
    });
  }

  _onViewPollingChatroom(
    ViewPollingChatroom event,
    Emitter<ChatroomState> emit,
  ) async {
    final currentUserId = await SecureStorage().getCredentials(userIdKey);
    final response = await _chatroomUseCase(event.projectId);
    response.fold((error) {
      emit(ViewChatroomFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(
        ViewPollingChatroomSuccess(
          currentUserId: currentUserId!,
          response: response,
        ),
      );
    });
  }

  _onUpdateChatMessages(
    UpdateChatMessages event,
    Emitter<ChatroomState> emit,
  ) {
    emit(ChatMessagesUpdated(event.messages, event.userId));
  }

  _onSearchMessage(SearchMessage event, Emitter<ChatroomState> emit) async {
    emit(SendMessageLoading());
    final response = await _searchMessagesUseCase(SearchMessageParam(
      event.projectId,
      event.message,
    ));
    response.fold((error) {
      emit(SearchMessageFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(SearchMessageSuccess(response: response));
      emit(ChatroomInitial());
    });
  }

  _onSendMessage(SendMessage event, Emitter<ChatroomState> emit) async {
    emit(SendMessageLoading());
    final response = await _sendMessageUseCase(SendMessageParam(
      event.projectId,
      event.message,
      event.replyId,
    ));
    response.fold((error) {
      emit(SendMessageFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(SendMessageSuccess(response: response));
      emit(ChatroomInitial());
    });
  }

  _onDeleteMessage(DeleteMessage event, Emitter<ChatroomState> emit) async {
    emit(DeleteMessageLoading());
    final response = await _deleteMessageUseCase(
      DeleteMessageParam(
        event.projectId,
        event.messageId,
      ),
    );
    response.fold((error) {
      emit(DeleteMessageFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(DeleteMessageSuccess(response: response));
    });
  }

  _onEditMessage(EditMessage event, Emitter<ChatroomState> emit) async {
    emit(EditMessageLoading());
    final response = await _editMessageUseCase(
      EditMessageParam(
        event.projectId,
        event.messageId,
        event.editedMessage,
      ),
    );
    response.fold((error) {
      emit(EditMessageFailure(message: error.siteSyncError.message!));
    }, (response) {
      emit(EditMessageSuccess(response: response));
    });
  }
}
