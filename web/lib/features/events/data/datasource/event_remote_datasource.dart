import 'package:dio/dio.dart';
import 'package:site_sync/core/services/local_storage/secure_storage.dart';
import 'package:site_sync/core/services/network/api_service.dart';
import 'package:site_sync/core/utils/constants.dart';
import 'package:site_sync/features/events/data/models/add_event_request_model.dart';
import 'package:site_sync/features/events/data/models/add_event_response_model.dart';
import 'package:site_sync/features/events/data/models/delete_event_response_model.dart';
import 'package:site_sync/features/events/data/models/event_details_response_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/site_sync_error.dart';
import '../../../../core/services/network/end_points.dart';
import '../../../../core/utils/utils.dart';

abstract interface class EventsRemoteDataSource {
  Future<EventDetailsResponseModel> getAllEvents({
    required final String projectId,
  });

  Future<AddEventResponseModel> addEvent({
    required final String projectId,
    required final String eventName,
    required final String eventDetails,
    required final String eventDate,
    required final String eventStartTime,
    required final String eventEndTime,
    required final String eventLocation,
    required final String eventLink,
  });

  Future<DeleteEventResponseModel> deleteEvent({
    required final String projectId,
    required String eventId,
  });
}

class EventsRemoteDataSourceImpl implements EventsRemoteDataSource {
  final ApiService apiService;

  EventsRemoteDataSourceImpl(this.apiService);

  @override
  Future<EventDetailsResponseModel> getAllEvents({
    required final String projectId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.getAllEvents.url, {
        "projectId": projectId,
      });
      final response = await apiService.getRequest(
        url: url,
      );
      return EventDetailsResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<AddEventResponseModel> addEvent({
    required String projectId,
    required String eventName,
    required String eventDetails,
    required String eventDate,
    required String eventStartTime,
    required String eventEndTime,
    required String eventLocation,
    required String eventLink,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.addEvent.url, {
        "projectId": projectId,
      });
      final currentUserId = await SecureStorage().getCredentials(userIdKey);
      final response = await apiService.postRequest(
        payload: AddEventRequestModel(
          userId: currentUserId,
          eventName: eventName,
          eventDetails: eventDetails,
          eventDate: eventDate,
          eventStartTime: eventStartTime,
          eventEndTime: eventEndTime,
          eventLocation: eventLocation,
          eventLink: eventLink,
        ).toJson(),
        url: url,
      );
      return AddEventResponseModel.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }

  @override
  Future<DeleteEventResponseModel> deleteEvent({
    required String projectId,
    required String eventId,
  }) async {
    try {
      final url = replaceUrlParameters(EndPoints.deleteEvent.url, {
        "projectId": projectId,
        "eventId": eventId,
      });
      final response = await apiService.deleteRequest(
        url: url,
        payload: {},
      );
      return DeleteEventResponseModel.fromJson(
        response.data,
      );
    } on DioException catch (e) {
      throw ServerException(error: SiteSyncError.fromJson(e.response?.data));
    }
  }
}
