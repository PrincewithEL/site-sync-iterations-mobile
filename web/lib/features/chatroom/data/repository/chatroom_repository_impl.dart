import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/chatroom/data/datasource/chatroom_remote_datasource.dart';
import 'package:site_sync/features/chatroom/data/models/edit_message_response_mode.dart';
import 'package:site_sync/features/chatroom/data/models/send_message_response_model.dart';
import 'package:site_sync/features/chatroom/domain/entities/chatroom_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/search_message_request_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/search_message_response_entity.dart';

class ChatroomRepositoryImpl implements ChatRoomRepository {
  final ChatroomRemoteDataSource chatroomRemoteDataSource;

  ChatroomRepositoryImpl(this.chatroomRemoteDataSource);

  @override
  Future<Either<Failure, DeleteMessageResponseEntity>> deleteMessage({
    required String mid,
    required String projectId,
  }) async {
    try {
      final response = await chatroomRemoteDataSource.deleteMessage(
        projectId: projectId,
        mid: mid,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, EditMessageResponseModel>> editMessage({
    required String projectId,
    required String mid,
    required String editedMessage,
  }) async {
    try {
      final response = await chatroomRemoteDataSource.editMessage(
        projectId: projectId,
        mid: mid,
        editedMessage: editedMessage,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, SendMessageResponseModel>> sendMessage({
    required String projectId,
    required String message,
    required String replyId,
  }) async {
    try {
      final response = await chatroomRemoteDataSource.sendMessage(
        projectId: projectId,
        message: message,
        replyId: replyId,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, ChatroomResponseEntity>> viewChatRoom({
    required String projectId,
  }) async {
    try {
      final response =
          await chatroomRemoteDataSource.viewChatRoom(projectId: projectId);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }

  @override
  Future<Either<Failure, SearchMessageResponseEntity>> searchMessage({
    required String projectId,
    required String message,
  }) async {
    try {
      final response = await chatroomRemoteDataSource.searchMessage(
        projectId: projectId,
        message: message,
      );
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(siteSyncError: e.error));
    }
  }
}
