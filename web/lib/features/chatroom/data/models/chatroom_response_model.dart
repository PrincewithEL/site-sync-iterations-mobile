import 'package:site_sync/features/chatroom/domain/entities/chatroom_response_entity.dart';

class ChatroomResponseModel extends ChatroomResponseEntity {
  ChatroomResponseModel({
    required super.data,
    required super.message,
    required super.statusCode,
  });

  factory ChatroomResponseModel.fromJson(final Map<String, dynamic> json) {
    return ChatroomResponseModel(
      data: ChatDataModel.fromJson(json["data"] as Map<String, dynamic>),
      message: json["message"],
      statusCode: json["status_code"],
    );
  }
}

class ChatDataModel extends ChatDataEntity {
  ChatDataModel({
    required super.chatMessages,
    required super.project,
    required super.projectMemberDetails,
  });

  factory ChatDataModel.fromJson(final Map<String, dynamic> json) {
    return ChatDataModel(
      chatMessages: json['chat_messages'] != null
          ? (json['chat_messages'] as List<dynamic>)
              .map((item) =>
                  ChatMessageModel.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      project:
          ChatProjectModel.fromJson(json['project'] as Map<String, dynamic>),
      projectMemberDetails: json['project_member_details'] != null
          ? (json['project_member_details'] as List<dynamic>)
              .map((item) => ChatProjectMemberDetailsModel.fromJson(
                  item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class ChatMessageModel extends ChatMessagesEntity {
  ChatMessageModel({
    required super.file,
    required super.senderName,
    required super.fileExtension,
    required super.id,
    required super.isRead,
    required super.isStarred,
    required super.message,
    required super.receiver,
    required super.receiverType,
    required super.replyingToMessage,
    required super.sender,
    required super.timestamp,
  });

  factory ChatMessageModel.fromJson(final Map<String, dynamic> json) {
    return ChatMessageModel(
      file: json["file"],
      senderName: json["sender_name"],
      fileExtension: json["file_extension"],
      id: json["id"],
      isRead: json["is_read"],
      isStarred: json["is_starred"],
      message: json["message"],
      receiver: json["receiver"],
      receiverType: json["receiver_type"],
      replyingToMessage: json["replying_to_message"],
      sender: json["sender"],
      timestamp: json["timestamp"],
    );
  }
}

class ChatProjectMemberDetailsModel extends ChatProjectMemberDetailsEntity {
  ChatProjectMemberDetailsModel({
    required super.firstName,
    required super.id,
    required super.image,
    required super.lastName,
    required super.loggedIn,
    required super.loggedOut,
    required super.online,
    required super.phoneNumber,
    required super.role,
    required super.userType,
  });

  factory ChatProjectMemberDetailsModel.fromJson(
      final Map<String, dynamic> json) {
    return ChatProjectMemberDetailsModel(
      firstName: json["first_name"],
      id: json["id"],
      image: json["image"],
      lastName: json["last_name"],
      loggedIn: json["logged_in"],
      loggedOut: json["logged_out"],
      online: json["online"],
      phoneNumber: json["phone_number"],
      role: json["role"],
      userType: json["user_type"],
    );
  }
}

class ChatProjectModel extends ChatProjectEntity {
  ChatProjectModel({
    required super.id,
    required super.name,
  });

  factory ChatProjectModel.fromJson(final Map<String, dynamic> json) {
    return ChatProjectModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
