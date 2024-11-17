part of 'chatroom_bloc.dart';

@immutable
sealed class ChatroomEvent {}

final class ViewChatroom extends ChatroomEvent {
  final String projectId;

  ViewChatroom({
    required this.projectId,
  });
}

final class ViewPollingChatroom extends ChatroomEvent {
  final String projectId;

  ViewPollingChatroom({
    required this.projectId,
  });
}

class UpdateChatMessages extends ChatroomEvent {
  final List<ChatMessagesEntity> messages;
  final String userId;

  UpdateChatMessages({required this.messages, required this.userId});
}

final class SendMessage extends ChatroomEvent {
  final String projectId;
  final String message;
  final String replyId;

  SendMessage({
    required this.projectId,
    required this.message,
    required this.replyId,
  });
}

final class EditMessage extends ChatroomEvent {
  final String projectId;
  final String messageId;
  final String editedMessage;

  EditMessage({
    required this.projectId,
    required this.messageId,
    required this.editedMessage,
  });
}

final class DeleteMessage extends ChatroomEvent {
  final String projectId;
  final String messageId;

  DeleteMessage({
    required this.projectId,
    required this.messageId,
  });
}

final class SearchMessage extends ChatroomEvent {
  final String projectId;
  final String message;

  SearchMessage({
    required this.projectId,
    required this.message,
  });
}
