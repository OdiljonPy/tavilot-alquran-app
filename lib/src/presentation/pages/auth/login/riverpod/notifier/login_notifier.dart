import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/utils/utils.dart';
import '../state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState());

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text,
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }
  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<void> login(
    BuildContext context, {
    String? phoneNumber,
    VoidCallback? checkYourNetwork,
    VoidCallback? unAuthorised,
    VoidCallback? goToMain,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await authRepository.login(
      phoneNumber: phoneNumber ?? '',
      password: state.password,
    );
    response.when(
      success: (data) async {
        await LocalStorage.setToken(data.result?.accessToken ?? '');
        await LocalStorage.setUserRate(data.result?.userRate ?? 1);
        await LocalStorage.setRefreshDay(DateTime.now().toString());
        await LocalStorage.setRefreshToken(data.result?.refreshToken);
        goToMain?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false, isLoginError: true);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  Future<void> refresh(BuildContext context,
      {required String refreshToken, VoidCallback? onSuccess}) async {
    final response = await authRepository.refreshToken(
      refreshToken: refreshToken,
    );
    response.when(
      success: (data) async {
        state = state.copyWith(isLoading: false);
        await LocalStorage.setToken(data.result?.accessToken ?? '');
        await LocalStorage.setRefreshToken(data.result?.refreshToken ?? '');
        await LocalStorage.setRefreshDay(DateTime.now().toString());
        onSuccess?.call();
      },
      failure: (failure, status) {
        LocalStorage.logOut();
        state = state.copyWith(isLoading: false, isLoginError: true);
        context.replaceRoute(const SplashRoute());
      },
    );
  }
}
