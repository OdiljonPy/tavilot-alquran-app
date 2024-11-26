import 'dart:io';
import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/utils/utils.dart';
import '../state/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {

  LoginNotifier(
      )
      : super(const LoginState());

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

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  Future<void> login({
    String? phoneNumber,
    VoidCallback? checkYourNetwork,
    VoidCallback? unAuthorised,
    VoidCallback? goToMain,
  }) async {
    final connected = await AppConnectivity.connectivity();
    state = state.copyWith(isLoading: true);
    final response = await authRepository.login(
      phoneNumber: phoneNumber ?? '',
      password: state.password,
    );
    response.when(
      success: (data) async {
        await LocalStorage.setToken(data.result?.accessToken ?? '');
        await LocalStorage.setUserRate(data.result?.userRate ?? 1);
        // await LocalStorage.setre(data.result?.user);
        goToMain?.call();
        // fetchCurrencies(
        //   checkYourNetworkConnection: checkYourNetwork,
        //   goToMain: goToMain,
        // );

        // res.when(
        //   success: (s) {
        //     LocalStorage.setUser(s.data);
        //     LocalStorage.setWallet(s.data?.wallet);
        //   },
        //   failure: (failure, status) {},
        // );

        if (Platform.isAndroid || Platform.isIOS) {
          String? fcmToken;
          try {
            // fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          // _authRepository.updateFirebaseToken(fcmToken);
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false, isLoginError: true);
        if (status == 401) {
          LocalStorage.deleteUser();
          unAuthorised?.call();
        }
        debugPrint('==> login failure: $failure');
      },
    );
    // if (connected) {
    //   // if (!AppValidators.isValidEmail(state.email)) {
    //   //   state = state.copyWith(isEmailNotValid: true);
    //   //   return;
    //   // }
    //
    // } else {
    //   // checkYourNetwork?.call();
    // }
  }
  //
  // Future<void> fetchCurrencies({
  //   VoidCallback? checkYourNetworkConnection,
  //   VoidCallback? goToMain,
  // }) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     state = state.copyWith(isCurrenciesLoading: true);
  //     final response = await _currenciesRepository.getCurrencies();
  //     response.when(
  //       success: (data) async {
  //         int defaultCurrencyIndex = 0;
  //         final List<CurrencyData> currencies = data.data ?? [];
  //         for (int i = 0; i < currencies.length; i++) {
  //           if (currencies[i].isDefault ?? false) {
  //             defaultCurrencyIndex = i;
  //             break;
  //           }
  //         }
  //         LocalStorage.setSelectedCurrency(currencies[defaultCurrencyIndex]);
  //         state = state.copyWith(isCurrenciesLoading: false);
  //         goToMain?.call();
  //       },
  //       failure: (failure, status) {
  //         state = state.copyWith(isCurrenciesLoading: false);
  //         goToMain?.call();
  //         debugPrint('==> get currency failure: $failure');
  //       },
  //     );
  //   } else {
  //     checkYourNetworkConnection?.call();
  //     goToMain?.call();
  //   }
  // }
}
