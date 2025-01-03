import 'package:al_quran/src/models/response/check_subscription.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/di/dependency_manager.dart';
import '../../core/utils/app_helpers.dart';
import '../../handlers/handlers.dart';
import '../../models/models.dart';
import '../../models/response/register_response.dart';
import '../../models/response/resend_response.dart';
import '../../models/response/reset_token_response.dart';
import '../../models/response/sign_up_request.dart';
import '../auth_facade.dart';

class AuthRepository implements AuthFacade {
  @override
  Future<ApiResult<LoginResponse>> login({
    required String phoneNumber,
    required String password,
  }) async {
    final data = {
      'phone_number': AppHelpers.phoneNumberSpaceRemover(phoneNumber),
      'password': password,
    };
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        '/api/v1/auth/login/',
        data: data,
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> login failure: $e');
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
  Future<ApiResult<LoginResponse>> refreshToken({
    required String refreshToken,
  }) async {
    final data = {
      'refresh': refreshToken,
    };
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        '/api/v1/auth/refresh/',
        data: data,
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> refresh failure: $e');
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
  Future<ApiResult<ReSendResponse>> reSendCode({required String otpKey}) async {
    final data = {'otp_key': otpKey};
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        'api/v1/auth/resend/',
        data: data,
      );
      return ApiResult.success(
        data: ReSendResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> re send otp failure: $e');
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
  Future<ApiResult<ReSendResponse>> resetPassword(
      {required String phoneNumber}) async {
    final data = {
      'phone_number': AppHelpers.phoneNumberSpaceRemover(phoneNumber)
    };
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        'api/v1/auth/reset/',
        data: data,
      );
      return ApiResult.success(
        data: ReSendResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> reset password failure: $e');
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
  Future<ApiResult<ResetTokenResponse>> resetToken(
      {required String otpKey, required String otpCode}) async {
    final data = {'otp_key': otpKey, 'otp_code': int.parse(otpCode)};
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        'api/v1/auth/resent/verify/',
        data: data,
      );
      return ApiResult.success(
        data: ResetTokenResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> check reset token failure: $e');
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
  Future<ApiResult<dynamic>> updatePassword(
      {required String resetToken, required String phoneNumber}) async {
    final data = {'new_password': phoneNumber};
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        'api/v1/auth/change/password/$resetToken/',
        data: data,
      );
      return ApiResult.success(
        data: response.data,
      );
    } catch (e) {
      debugPrint('==> update password failure: $e');
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
  Future<ApiResult<dynamic>> sendOtp(
      {required String otpKey, required int otpCode}) async {
    final data = {'otp_key': otpKey, 'otp_code': otpCode};
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        '/api/v1/auth/verify/',
        data: data,
      );
      return ApiResult.success(data: response.data);
    } catch (e) {
      debugPrint('==> send otp failure: $e');
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
  Future<ApiResult<RegisterResponse>> signUp({
    required String phoneNumber,
    required String password,
  }) async {
    final data = SignUpRequest(
      phoneNumber: AppHelpers.phoneNumberSpaceRemover(phoneNumber),
      password: password,
    );
    try {
      final client = dioHttp.client(requireAuth: false, optional: false);
      final response = await client.post(
        '/api/v1/auth/register/',
        data: data.toJson(),
      );
      debugPrint('==> gooood');

      return ApiResult.success(
        data: RegisterResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> forgot password failure: $e');
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
  Future<ApiResult<CheckSubscription>> checkSubscription() async {

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/auth/check/subscription/',
      );

      return ApiResult.success(
        data: CheckSubscription.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> forgot password failure: $e');
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
