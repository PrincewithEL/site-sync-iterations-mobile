import 'package:site_sync/features/chatroom/domain/entities/delete_message_entity.dart';

class DeleteChatModel extends DeleteMessageEntity {
  DeleteChatModel({
    required super.mid,
    required super.userId,
  });

  factory DeleteChatModel.fromJson(final Map<String, dynamic> json) {
    return DeleteChatModel(
      mid: json["mid"],
      userId: json["user_id"],
    );
  }
}
