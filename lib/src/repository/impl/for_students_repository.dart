import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../../models/response/categories_response.dart';
import '../for_students_facade.dart';

class  ForStudentsRepository implements ForStudentsFacade {
  @override
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      final client = dioHttp.client(requireAuth: true);
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
