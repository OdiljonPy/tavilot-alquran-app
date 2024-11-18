import '../handlers/api_result.dart';
import '../models/models.dart';
import '../models/response/register_response.dart';
import '../models/response/resend_response.dart';
import '../models/response/reset_token_response.dart';
import '../models/response/update_response.dart';
import '../models/response/user_response.dart';

abstract class AuthFacade {
  Future<ApiResult<LoginResponse>> login({
    required String phoneNumber,
    required String password,
  });

  Future<ApiResult<UserResponse>> getInfoByPINFL({
    required String pinfl,
  });

  Future<ApiResult<UpdateResponse>> update({
    required String fullName,
    required String birthDate,
    required String pinfl,
    required String placeIssue,
    required String placeResidence,
    required String dateIssue ,
    required String passportSeries,
  });

  Future<ApiResult<LoginResponse>> refreshToken({
    required String refreshToken,
  });

  Future<ApiResult<ReSendResponse>> reSendCode({
    required String otpKey,
  });

  Future<ApiResult<RegisterResponse>> signUp({
    required String password,
    required String phoneNumber,
    required String deviceId,
  });

  Future<ApiResult<LoginResponse>> sendOtp(
      {required String otpKey, required int otpCode});

  Future<ApiResult<ReSendResponse>> resetPassword({
    required String phoneNumber,
  });

  Future<ApiResult<ResetTokenResponse>> resetToken({
    required String otpKey,
    required String otpCode,
  });

  Future<ApiResult<dynamic>> updatePassword({
    required String resetToken,
    required String phoneNumber
  });

  Future<ApiResult<UserResponse>> getUser();
}
