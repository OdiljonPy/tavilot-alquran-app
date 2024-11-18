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
import '../../models/response/update_response.dart';
import '../../models/response/user_response.dart';
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
      final client = dioHttp.client(requireAuth: false);
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
  Future<ApiResult<UpdateResponse>> update({
    required String fullName,
    required String birthDate,
    required String pinfl,
    required String placeIssue,
    required String placeResidence,
    required String dateIssue,
    required String passportSeries,
  }) async {
    final data = {
      'full_name': fullName,
      'birth_date': birthDate,
      'pinfl': pinfl,
      'place_issue': placeIssue,
      'place_residence': placeResidence,
      'date_issue': dateIssue,
      'passport_seria': passportSeries,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.patch(
        '/api/v1/auth/update/',
        data: data,
      );
      return ApiResult.success(
        data: UpdateResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> update failure: $e, $s');
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
  Future<ApiResult<UserResponse>> getInfoByPINFL({
    required String pinfl,
  }) async {
    final data = {
      'pinfl': pinfl,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/auth/information/',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UserResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get info by pinfl failure: $e');
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
      final client = dioHttp.client(requireAuth: false);
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
  Future<ApiResult<UserResponse>> getUser() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/auth/me/',
      );
      return ApiResult.success(
        data: UserResponse.fromJson(response.data),
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
  Future<ApiResult<ReSendResponse>> reSendCode({required String otpKey}) async {
    final data = {'otp_key': otpKey};
    try {
      final client = dioHttp.client(requireAuth: false);
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
      final client = dioHttp.client(requireAuth: false);
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
      final client = dioHttp.client(requireAuth: false);
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
      final client = dioHttp.client(requireAuth: false);
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
  Future<ApiResult<LoginResponse>> sendOtp(
      {required String otpKey, required int otpCode}) async {
    final data = {'otp_key': otpKey, 'otp_code': otpCode};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        'api/v1/auth/verify/',
        data: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
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

  // @override
  // Future<ApiResult<RegisterResponse>> forgotPassword({
  //   required String email,
  // }) async {
  //   final data = {'email': email};
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false);
  //     final response = await client.post(
  //       '/api/v1/auth/forgot/email-password',
  //       queryParameters: data,
  //     );
  //     return ApiResult.success(data: RegisterResponse.fromJson(response.data));
  //   } catch (e) {
  //     debugPrint('==> forgot password failure: $e');
  //     return ApiResult.failure(
  //         error: AppHelpers.errorHandler(e),
  //         statusCode: NetworkExceptions.getDioStatus(e));
  //   }
  // }

  // @override
  // Future<ApiResult<VerifyData>> forgotPasswordConfirm({
  //   required String verifyCode,
  //   required String email,
  // }) async {
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false);
  //     final response = await client.post(
  //       '/api/v1/auth/forgot/email-password/$verifyCode?email=$email',
  //     );
  //
  //     return ApiResult.success(
  //       data: VerifyData.fromJson(response.data["data"]),
  //     );
  //   } catch (e) {
  //     debugPrint('==> forgot password confirm failure: $e');
  //     return ApiResult.failure(
  //         error: AppHelpers.errorHandler(e),
  //         statusCode: NetworkExceptions.getDioStatus(e));
  //   }
  // }

  @override
  Future<ApiResult<RegisterResponse>> signUp({
    required String phoneNumber,
    required String password,
    required String deviceId,
  }) async {
    final data = SignUpRequest(
      phoneNumber: AppHelpers.phoneNumberSpaceRemover(phoneNumber),
      password: password, deviceId: deviceId,
    );
    try {
      final client = dioHttp.client(requireAuth: false);
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
}
