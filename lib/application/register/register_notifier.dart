import 'dart:async';
import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {

  RegisterNotifier(
      ) : super(const RegisterState());

  void setPassword(String password) {
    state = state.copyWith(password: password.trim(), isPasswordInvalid: false);
  }

  void setPhone(String value) {
    state = state.copyWith(
      phone: value.trim(),
    );
  }

  void checkPassword(String? value) {
    if (value != null) {
      state = state.copyWith(
          isMinimumLength: value.length >= 8,
          isMinimumNum: value.contains(RegExp(r'\d')),
          isMinimumChar: value.contains(RegExp(r'[A-Za-z]')));
    }
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  setPasswordFocus(bool hasFocus) {
    state = state.copyWith(hasFocus: hasFocus);
  }

  void toggleAcceptTerms() {
    state = state.copyWith(isAcceptTerms: !state.isAcceptTerms);
  }

  Future<void> register(BuildContext context,
      {VoidCallback? onSuccess,
        required String phoneNumber,
        required String password}) async {
    state = state.copyWith(isLoading: true);
    final response = await authRepository.signUp(
        password: password, phoneNumber: phoneNumber);

    response.when(
      success: (data) async {
        state = state.copyWith(isLoading: false, otpKey: data.result?.otpKey);
        onSuccess?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        // if (status == 400) {
        //   AppHelpers.errorSnackBar(
        //       context: context, message: failure.toString());
        // } else {
        //   AppHelpers.errorSnackBar(
        //       context: context, message: failure.toString());
        // }
      },
    );
  }
}
