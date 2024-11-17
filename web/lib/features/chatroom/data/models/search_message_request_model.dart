import 'package:site_sync/features/chatroom/domain/entities/search_message_request_entity.dart';

class SearchMessageRequestModel extends SearchMessageRequestEntity {
  SearchMessageRequestModel({
    required super.searchQuery,
    required super.userId,
  });

  factory SearchMessageRequestModel.fromJson(Map<String, dynamic> json) {
    return SearchMessageRequestModel(
      searchQuery: json['search_query'],
      userId: json['user_id'],
    );
  }
}
