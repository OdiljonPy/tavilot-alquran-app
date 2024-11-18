import 'package:al_quran/src/core/constants/constants.dart';
import 'package:dio/dio.dart';
import '../../main.dart';
import 'token_interceptor.dart';

class HttpService {
  Dio client({bool requireAuth = false, bool optional = false}) => Dio(
        BaseOptions(
          baseUrl: SecretVars.baseUrl,
          connectTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
          sendTimeout: const Duration(seconds: 40),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Accept-Language':
                currentLocale?.countryCode?.toLowerCase() ?? 'ru',
          },
        ),
      )
        ..interceptors
            .add(TokenInterceptor(requireAuth: requireAuth, optional: optional))
        ..interceptors.add(
          LogInterceptor(
              requestBody: true, responseBody: true, responseHeader: false),
        );
}
