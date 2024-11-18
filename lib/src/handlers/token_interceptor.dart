import 'package:dio/dio.dart';

import '../core/utils/local_storage.dart';


class TokenInterceptor extends Interceptor {
  final bool requireAuth;
  final bool optional;

  TokenInterceptor({
    required this.requireAuth,
    this.optional = false,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = LocalStorage.getToken();
    if (optional) {
      if (token.isNotEmpty) {
        options.headers.addAll({'Authorization': 'Bearer $token'});
      }
      handler.next(options);
    } else {
      if (token.isNotEmpty && requireAuth) {
        options.headers.addAll({'Authorization': 'Bearer $token'});
      }
      handler.next(options);
    }
  }
}
