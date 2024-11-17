import 'package:fpdart/fpdart.dart';
import 'package:site_sync/core/error/failures.dart';
import 'package:site_sync/core/usecase/usecase.dart';
import 'package:site_sync/features/chatroom/domain/entities/edit_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/entities/search_message_response_entity.dart';
import 'package:site_sync/features/chatroom/domain/repository/chatroom_repository.dart';

class SearchMessagesUseCase
    implements UseCase<SearchMessageResponseEntity, SearchMessageParam> {
  final ChatRoomRepository chatRoomRepository;

  SearchMessagesUseCase(this.chatRoomRepository);

  @override
  Future<Either<Failure, SearchMessageResponseEntity>> call(
      SearchMessageParam param) {
    return chatRoomRepository.searchMessage(
      projectId: param.projectId,
      message: param.message,
    );
  }
}

class SearchMessageParam {
  final String projectId;
  final String message;

  SearchMessageParam(
    this.projectId,
    this.message,
  );
}
