import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/features/chatroom/domain/entities/chatroom_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/edit_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/search_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/send_message_response_entity.dart';

abstract interface class ChatRoomRepository {
  Future<Either<Failure, ChatroomResponseEntity>> viewChatRoom({
    required String projectId,
  });

  Future<Either<Failure, EditMessageResponseEntity>> editMessage({
    required String projectId,
    required final String mid,
    required final String editedMessage,
  });

  Future<Either<Failure, DeleteMessageResponseEntity>> deleteMessage({
    required String projectId,
    required final String mid,
  });

  Future<Either<Failure, SendMessageResponseEntity>> sendMessage({
    required String projectId,
    required final String message,
    required final String replyId,
  });

  Future<Either<Failure, SearchMessageResponseEntity>> searchMessage({
    required String projectId,
    required final String message,
  });
}
