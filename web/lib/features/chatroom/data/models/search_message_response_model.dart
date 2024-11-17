import 'package:site_sync/features/chatroom/domain/entities/search_message_response_entity.dart';

class SearchMessageResponseModel extends SearchMessageResponseEntity {
  SearchMessageResponseModel({
    required super.messages,
    required super.success,
  });

  factory SearchMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchMessageResponseModel(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => SearchMessagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'],
    );
  }
}

class SearchMessagesModel extends SearchMessagesEntity {
  SearchMessagesModel({
    required super.chatId,
    required super.file,
    required super.isBookmarked,
    required super.message,
    required super.readStatus,
    required super.reply,
    required super.senderUser,
    required super.timestamp,
    required super.updatedAt,
  });

  factory SearchMessagesModel.fromJson(Map<String, dynamic> json) {
    return SearchMessagesModel(
      chatId: json['chat_id'],
      file: json['file'],
      isBookmarked: json['is_bookmarked'],
      message: json['message'],
      // Map the dynamic list to a list of ReadStatusModel objects
      readStatus: (json['read_status'] as List)
          .map((e) => ReadStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply: json['reply'],
      senderUser: SenderUserModel.fromJson(json['sender_user'] as Map<String, dynamic>),
      timestamp: json['timestamp'],
      updatedAt: json['updated_at'],
    );
  }
}

// read_status_model.dart
class ReadStatusModel extends ReadStatus {
  ReadStatusModel({
    required super.userId,
    required super.username,
    required super.status,
  });

  factory ReadStatusModel.fromJson(Map<String, dynamic> json) {
    return ReadStatusModel(
      userId: json['user_id'],
      username: json['username'],
      status: json['status'],
    );
  }
}

// sender_user_model.dart
class SenderUserModel extends SenderUser {
  SenderUserModel({
    required super.id,
    required super.firstName,
    required super.profilePicture,
  });

  factory SenderUserModel.fromJson(Map<String, dynamic> json) {
    return SenderUserModel(
      id: json['id'],
      firstName: json['first_name'],
      profilePicture: json['profile_picture'],
    );
  }
}

