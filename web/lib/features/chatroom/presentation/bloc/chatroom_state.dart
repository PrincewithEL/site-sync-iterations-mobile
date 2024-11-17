part of 'chatroom_bloc.dart';

@immutable
sealed class ChatroomState {}

final class ChatroomInitial extends ChatroomState {}

// View Chat
final class ViewChatroomLoading extends ChatroomState {}

final class ViewChatroomSuccess extends ChatroomState {
  final String currentUserId;
  final ChatroomResponseEntity response;

  ViewChatroomSuccess({
    required this.currentUserId,
    required this.response,
  });
}

final class ViewPollingChatroomSuccess extends ChatroomState {
  final String currentUserId;
  final ChatroomResponseEntity response;

  ViewPollingChatroomSuccess({
    required this.currentUserId,
    required this.response,
  });
}

class ChatMessagesUpdated extends ChatroomState {
  final List<ChatMessagesEntity> chatMessages;
  final String currentUserId;

  ChatMessagesUpdated(this.chatMessages, this.currentUserId);
}

final class ViewChatroomFailure extends ChatroomState {
  final String message;

  ViewChatroomFailure({required this.message});
}

// Send Message
final class SendMessageLoading extends ChatroomState {}

final class SendMessageSuccess extends ChatroomState {
  final SendMessageResponseEntity response;

  SendMessageSuccess({required this.response});
}

final class SendMessageFailure extends ChatroomState {
  final String message;

  SendMessageFailure({required this.message});
}

// Delete Message
final class DeleteMessageLoading extends ChatroomState {}

final class DeleteMessageSuccess extends ChatroomState {
  final DeleteMessageResponseEntity response;

  DeleteMessageSuccess({required this.response});
}

final class DeleteMessageFailure extends ChatroomState {
  final String message;

  DeleteMessageFailure({required this.message});
}

// Edit Message
final class EditMessageLoading extends ChatroomState {}

final class EditMessageSuccess extends ChatroomState {
  final EditMessageResponseEntity response;

  EditMessageSuccess({required this.response});
}

final class EditMessageFailure extends ChatroomState {
  final String message;

  EditMessageFailure({required this.message});
}

// Search Message
final class SearchMessageLoading extends ChatroomState {}

final class SearchMessageSuccess extends ChatroomState {
  final SearchMessageResponseEntity response;

  SearchMessageSuccess({required this.response});
}

final class SearchMessageFailure extends ChatroomState {
  final String message;

  SearchMessageFailure({required this.message});
}
