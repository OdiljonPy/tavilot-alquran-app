import 'package:al_quran/src/models/response/juz_list_response.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:al_quran/src/models/response/search_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../juz_facade.dart';

class  JuzRepository implements JuzFacade {
  @override
  Future<ApiResult<JuzListResponse>> getJuzes({String? lang}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        '/api/v1/juz/',
      );
      return ApiResult.success(
        data: JuzListResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get juz failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage = AppHelpers.errorCodeToMessage(errorResponse['error_code']);
        return ApiResult.failure(
            error: errorMessage, statusCode: NetworkExceptions.getDioStatus(e));
      } else {
        return ApiResult.failure(
            error: AppHelpers.errorHandler(e),
            statusCode: NetworkExceptions.getDioStatus(e));
      }
    }
  }

  @override
  Future<ApiResult<JuzResponse>> getJuz({required int id, String? lang}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        '/api/v1/juz/$id/',
      );
      return ApiResult.success(
        data: JuzResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get juz failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage = AppHelpers.errorCodeToMessage(errorResponse['error_code']);
        return ApiResult.failure(
            error: errorMessage, statusCode: NetworkExceptions.getDioStatus(e));
      } else {
        return ApiResult.failure(
            error: AppHelpers.errorHandler(e),
            statusCode: NetworkExceptions.getDioStatus(e));
      }
    }
  }

  @override
  Future<ApiResult<SearchResponse>> getSearchResults(String query, int index) async {
    final data  = {
      "q": query,
      "search_type": index,
    };
    try {
      final client = dioHttp.client(optional: true);
      final response = await client.get(
        '/api/v1/search/',
        queryParameters: data
      );
      return ApiResult.success(
        data: SearchResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get search failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage = AppHelpers.errorCodeToMessage(errorResponse['error_code']);
        return ApiResult.failure(
            error: errorMessage, statusCode: NetworkExceptions.getDioStatus(e));
      } else {
        return ApiResult.failure(
            error: AppHelpers.errorHandler(e),
            statusCode: NetworkExceptions.getDioStatus(e));
      }
    }
  }

}
