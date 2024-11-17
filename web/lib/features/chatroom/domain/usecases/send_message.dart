import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/chatroom/domain/entities/send_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

class SendMessageUseCase
    implements UseCase<SendMessageResponseEntity, SendMessageParam> {
  final ChatRoomRepository chatRoomRepository;

  SendMessageUseCase(this.chatRoomRepository);

  @override
  Future<Either<Failure, SendMessageResponseEntity>> call(
      SendMessageParam param) {
    return chatRoomRepository.sendMessage(
      projectId: param.projectId,
      message: param.message,
      replyId: param.replyId,
    );
  }
}

class SendMessageParam {
  final String projectId;
  final String message;
  final String replyId;

  SendMessageParam(
    this.projectId,
    this.message,
    this.replyId,
  );
}
