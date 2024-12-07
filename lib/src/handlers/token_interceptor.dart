import 'package:dio/dio.dart';
import 'package:auto_route/auto_route.dart';
import '../core/routes/app_router.dart';
import '../core/utils/local_storage.dart';
import '../presentation/pages/pages.dart';

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

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      LocalStorage.logOut();
      c?.router.popUntilRoot();
      c?.replaceRoute(const SplashRoute());
    }
    handler.next(err);
  }
}
