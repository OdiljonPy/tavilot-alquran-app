import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Image;

import '../../presentation/pages/auth/confirmation/register_confirmation_page.dart';
import '../../presentation/pages/auth/login/login_page.dart';
import '../../presentation/pages/auth/pin_code/pin_code_page.dart';
import '../../presentation/pages/auth/register/register_page.dart';
import '../../presentation/pages/initial/splash_page.dart';
import '../../presentation/pages/main/main_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    CupertinoRoute(path: '/', page: SplashRoute.page, initial: true),
    CupertinoRoute(path: '/main', page: MainRoute.page),
    CupertinoRoute(path: '/login', page: LoginRoute.page),
    CupertinoRoute(path: '/register', page: RegisterRoute.page),
    CupertinoRoute(path: '/registerConfirmation', page: RegisterConfirmationRoute.page),
    CupertinoRoute(path: '/pinCode', page: PinCodeRoute.page),
  ];
}
