import 'package:al_quran/src/models/response/chapter_response.dart';
import 'package:al_quran/src/models/response/single_chapter_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../chapter_facade.dart';

class  ChapterRepository implements ChapterFacade {
  @override
  Future<ApiResult<ChapterResponse>> getChapters() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/chapters/',
      );
      return ApiResult.success(
        data: ChapterResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> auth me failure: $e');
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
  Future<ApiResult<SingleChapterResponse>> getChapter({required int id}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/chapter/$id/',
      );
      return ApiResult.success(
        data: SingleChapterResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get single chapter failure: $e');
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
