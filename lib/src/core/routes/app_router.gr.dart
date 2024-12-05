// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    PinCodeRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PinCodePage(
          args.isNewPassword,
          key: args.key,
        ),
      );
    },
    RegisterConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterConfirmationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterConfirmationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessPage(),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebViewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
  };
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PinCodePage]
class PinCodeRoute extends PageRouteInfo<PinCodeRouteArgs> {
  PinCodeRoute({
    required bool isNewPassword,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PinCodeRoute.name,
          args: PinCodeRouteArgs(
            isNewPassword: isNewPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const PageInfo<PinCodeRouteArgs> page =
      PageInfo<PinCodeRouteArgs>(name);
}

class PinCodeRouteArgs {
  const PinCodeRouteArgs({
    required this.isNewPassword,
    this.key,
  });

  final bool isNewPassword;

  final Key? key;

  @override
  String toString() {
    return 'PinCodeRouteArgs{isNewPassword: $isNewPassword, key: $key}';
  }
}

/// generated route for
/// [RegisterConfirmationPage]
class RegisterConfirmationRoute
    extends PageRouteInfo<RegisterConfirmationRouteArgs> {
  RegisterConfirmationRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterConfirmationRoute.name,
          args: RegisterConfirmationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterConfirmationRoute';

  static const PageInfo<RegisterConfirmationRouteArgs> page =
      PageInfo<RegisterConfirmationRouteArgs>(name);
}

class RegisterConfirmationRouteArgs {
  const RegisterConfirmationRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterConfirmationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessPage]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebViewPage]
class WebViewRoute extends PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    Key? key,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          WebViewRoute.name,
          args: WebViewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const PageInfo<WebViewRouteArgs> page =
      PageInfo<WebViewRouteArgs>(name);
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url}';
  }
}
