import 'package:al_quran/src/models/response/about_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../about_facade.dart';

class  AboutRepository implements AboutFacade {
  @override
  Future<ApiResult<AboutResponse>> getAboutUs() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/about/',
      );
      return ApiResult.success(
        data: AboutResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> about failure: $e');
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
