import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/chatroom/domain/entities/chatroom_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

class ViewChatroomUseCase implements UseCase<ChatroomResponseEntity, String> {
  final ChatRoomRepository chatRoomRepository;

  ViewChatroomUseCase(this.chatRoomRepository);

  @override
  Future<Either<Failure, ChatroomResponseEntity>> call(String projectId) {
    return chatRoomRepository.viewChatRoom(projectId: projectId);
  }
}
