import 'package:al_quran/src/models/models.dart';
import 'package:al_quran/src/models/response/get_categories_response.dart';
import 'package:al_quran/src/models/response/get_single_category_response.dart';
import 'package:al_quran/src/models/response/post_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../../models/response/categories_response.dart';
import '../for_students_facade.dart';

class ForStudentsRepository implements ForStudentsFacade {
  @override
  Future<ApiResult<CategoriesResponse>> getCategories({String? lang}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        '/api/v1/categories/',
      );
      return ApiResult.success(
        data: CategoriesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> categories failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage =
            AppHelpers.errorCodeToMessage(errorResponse['error_code']);
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
  Future<ApiResult<GetCategoryResponse>> getSingleCategory(
      {String? lang, required int index}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        index == 0
            ? '/api/v1/moturudiy/'
            : index == 1
                ? '/api/v1/manuscript/'
                : index == 2
                    ? '/api/v1/studies/'
                    : index == 3
                        ? '/api/v1/resources/'
                        : '/api/v1/refusal/',
      );
      return ApiResult.success(
        data: GetCategoryResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> categories failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage =
            AppHelpers.errorCodeToMessage(errorResponse['error_code']);
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
  Future<ApiResult<SingleCategoryResponse>> getCategory(
      {required int id, String? lang}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        '/api/v1/category/$id/',
      );
      return ApiResult.success(
        data: SingleCategoryResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> post failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage =
            AppHelpers.errorCodeToMessage(errorResponse['error_code']);
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
  Future<ApiResult<GetSingleCategory>> getPost(
      {required int id, required int index, String? lang}) async {
    try {
      final client = dioHttp.client(requireAuth: true, lang: lang);
      final response = await client.get(
        index == 0
            ? '/api/v1/moturudiy/$id/'
            : index == 1
                ? '/api/v1/manuscript/$id/'
                : index == 2
                    ? '/api/v1/studies/$id/'
                    : index == 3
                        ? '/api/v1/resources/$id/'
                        : '/api/v1/refusal/$id/',
      );
      return ApiResult.success(
        data: GetSingleCategory.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> post failure: $e');
      if (e is DioException && e.response != null) {
        final errorResponse = e.response?.data;
        final errorMessage =
            AppHelpers.errorCodeToMessage(errorResponse['error_code']);
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
