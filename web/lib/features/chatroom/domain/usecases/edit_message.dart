import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/chatroom/domain/entities/edit_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

class EditMessageUseCase implements UseCase<EditMessageResponseEntity, EditMessageParam> {
  final ChatRoomRepository chatRoomRepository;

  EditMessageUseCase(this.chatRoomRepository);

  @override
  Future<Either<Failure, EditMessageResponseEntity>> call(EditMessageParam param) {
    return chatRoomRepository.editMessage(
      projectId: param.projectId,
      mid: param.mid,
      editedMessage: param.editedMessage,
    );
  }
}

class EditMessageParam {
  final String projectId;
  final String mid;
  final String editedMessage;

  EditMessageParam(
    this.projectId,
    this.mid,
    this.editedMessage,
  );
}
