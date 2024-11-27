import '../handlers/api_result.dart';
import '../models/models.dart';
import '../models/response/register_response.dart';
import '../models/response/resend_response.dart';
import '../models/response/reset_token_response.dart';

abstract class AuthFacade {
  Future<ApiResult<LoginResponse>> login({
    required String phoneNumber,
    required String password,
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
  });

  Future<ApiResult<dynamic>> sendOtp(
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
}
