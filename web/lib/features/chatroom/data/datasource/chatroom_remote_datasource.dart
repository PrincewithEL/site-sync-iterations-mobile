import 'package:dio/dio.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/chatroom/data/models/chatroom_response_model.dart';
import 'package:site_sync/features/chatroom/data/models/delete_message_model.dart';
import 'package:site_sync/features/chatroom/data/models/delete_message_response_model.dart';
import 'package:site_sync/features/chatroom/data/models/edit_message_model.dart';
import 'package:site_sync/features/chatroom/data/models/edit_message_response_mode.dart';
import 'package:site_sync/features/chatroom/data/models/search_message_response_model.dart';
import 'package:site_sync/features/chatroom/data/models/send_message_request_model.dart';
import 'package:site_sync/features/chatroom/data/models/send_message_response_model.dart';
import 'package:site_sync/features/chatroom/domain/entities/delete_message_response_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';
import '../../../../core/services/network/end_points.dart';
import '../../../../core/utils/utils.dart';
import '../models/search_message_request_model.dart';

abstract interface class ChatroomRemoteDataSource {
  Future<ChatroomResponseModel> viewChatRoom({
    required String projectId,
  });

  Future<EditMessageResponseModel> editMessage({
    required String projectId,
    required final String mid,
    required final String editedMessage,
  });

  Future<DeleteMessageResponseEntity> deleteMessage({
    required String projectId,
    required final String mid,
  });

  Future<SendMessageResponseModel> sendMessage({
    required String projectId,
    required final String message,
    required final String replyId,
  });

  Future<SearchMessageResponseModel> searchMessage({
    required String projectId,
    required final String message,
  });
}

class ChatroomRemoteDataSourceImpl implements ChatroomRemoteDataSource {
  final ApiService apiService;

  ChatroomRemoteDataSourceImpl(this.apiService);

  @override
  Future<DeleteMessageResponseEntity> deleteMessage({
    required String projectId,
    required String mid,
  }) async {
    try {
      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final String url = replaceUrlParameters(
        EndPoints.deleteMessage.url,
        {"projectId": projectId},
      );
      final response = await apiService.postRequest(
        payload: DeleteChatModel(
          userId: currentUserId,
          mid: int.parse(
            mid,
          ),
        ).toJson(),
        url: url,
        allowAuthOption: true,
      );
      return DeleteMessageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<EditMessageResponseModel> editMessage({
    required String projectId,
    required String mid,
    required String editedMessage,
  }) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.editMessage.url,
        {"projectId": projectId},
      );
      final response = await apiService.postRequest(
        payload: EditMessageModel(
          editedMessage: editedMessage,
          mid: int.parse(
            mid,
          ),
        ).toJson(),
        url: url,
        allowAuthOption: true,
      );
      return EditMessageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<SendMessageResponseModel> sendMessage({
    required String projectId,
    required String message,
    required String replyId,
  }) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.sendMessage.url,
        {"projectId": projectId},
      );
      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final response = await apiService.postRequest(
        payload: SendMessageRequestModel(
          userId: currentUserId,
          message: message,
          replyMessageId: replyId.isEmpty ? null : replyId,
        ).toJson(),
        url: url,
        allowAuthOption: true,
      );
      return SendMessageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<ChatroomResponseModel> viewChatRoom(
      {required String projectId}) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.viewChatRoom.url,
        {"projectId": projectId},
      );
      final response = await apiService.getRequest(
        url: url,
        allowAuthOption: true,
      );
      return ChatroomResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<SearchMessageResponseModel> searchMessage({
    required String projectId,
    required String message,
  }) async {
    try {
      final String url = replaceUrlParameters(
        EndPoints.searchMessage.url,
        {"projectId": projectId},
      );
      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final response = await apiService.postRequest(
        payload: SearchMessageRequestModel(
          searchQuery: message,
          userId: int.parse(currentUserId!),
        ).toJson(),
        url: url,
        allowAuthOption: true,
      );
      return SearchMessageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
