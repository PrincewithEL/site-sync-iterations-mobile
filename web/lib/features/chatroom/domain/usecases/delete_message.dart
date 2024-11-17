import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

class DeleteMessageUseCase implements UseCase<DeleteMessageResponseEntity, DeleteMessageParam> {
  final ChatRoomRepository chatRoomRepository;

  DeleteMessageUseCase(this.chatRoomRepository);

  @override
  Future<Either<Failure, DeleteMessageResponseEntity>> call(DeleteMessageParam param) {
    return chatRoomRepository.deleteMessage(
      projectId: param.projectId,
      mid: param.mid,
    );
  }
}

class DeleteMessageParam {
  final String projectId;
  final String mid;

  DeleteMessageParam(
    this.projectId,
    this.mid,
  );
}
