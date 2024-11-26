import 'dart:async';
import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src/core/utils/app_connectivity.dart';
import '../../src/core/utils/local_storage.dart';
import 'register_confirmation_state.dart';

class RegisterConfirmationNotifier
    extends StateNotifier<RegisterConfirmationState> {

  RegisterConfirmationNotifier(
  ) : super(const RegisterConfirmationState());

  Timer? _timer;
  int _initialTime = 60;

  void setCode(String? code) {
    state = state.copyWith(
        confirmCode: code?.trim() ?? '',
        isCodeError: false,
        isConfirm: code.toString().length == 6);
  }

  void clear() {
    state = state.copyWith(otpKey: null, confirmCodeCount: 2, isAllowed: 2);
  }

  void isAllowed(){
    state = state.copyWith(isAllowed: 2);
  }

  Future<void> reSendCode(BuildContext context,
      {VoidCallback? onSuccess, String? otpKey}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false, isAllowed: 2);
      final response = await authRepository.reSendCode(
          otpKey: state.otpKey ?? otpKey ?? "");
      response.when(
        success: (data) {
          state =
              state.copyWith(isLoading: false, otpKey: data.result?.otpKey, confirmCodeCount: state.confirmCodeCount-1);
          onSuccess?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(
              isLoading: false, isCodeError: true, isSuccess: false);
          // AppHelpers.showCheckTopSnackBar(
          //   context,
          //   AppHelpers.getTranslation(failure.toString()),
          // );
          debugPrint('==> confirm code failure: $failure');
        },
      );
    } else {
      // if (mounted) {
      //   AppHelpers.showNoConnectionSnackBar(context);
      // }
    }
  }

  Future<void> confirmCode(BuildContext context, String? otpKey,
      {VoidCallback? onSuccess}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false, isAllowed: state.isAllowed - 1);
      final response = await authRepository.sendOtp(
        otpKey: state.otpKey ?? otpKey ?? "",
        otpCode: int.parse(state.confirmCode),
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          _timer?.cancel();
          onSuccess?.call();
          // state = state.copyWith(phoneNumber: phoneNumber);
          // await LocalStorage.setRefreshToken(data.result?.refreshToken ?? '');
          await LocalStorage.setToken(data.result?.accessToken ?? '');
          // await LocalStorage.setRefreshDay(DateTime.now().toString())
          //     .then((value) {
          //   onSuccess?.call();
          //   // if (context.mounted) {
          //   //   context.replaceRoute(const MainRoute());
          //   // }
          //   // return;
          // });
          state = state.copyWith(isLoading: false);
        },
        failure: (failure, status) {
          state = state.copyWith(
              isLoading: false, isCodeError: true, isSuccess: false);
          // AppHelpers.showCheckTopSnackBar(
          //   context,
          //   AppHelpers.getTranslation(failure.toString()),
          // );
          debugPrint('==> confirm code failure: $failure');
        },
      );
    } else {
      if (mounted) {
        // AppHelpers.showCheckTopSnackBar(
        //   context,
        //   AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        // );
      }
    }
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  void startTimer() {
    _timer?.cancel();
    _initialTime = 60;
    state = state.copyWith(
      confirmCode: '',
      isCodeError: false,
    );
    if (_timer != null) {
      _initialTime = 60;
      _timer?.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_initialTime < 1) {
          _timer?.cancel();
          state = state.copyWith(
            isTimeExpired: true,
          );
        } else {
          _initialTime--;
          state = state.copyWith(
            isTimeExpired: false,
            timerText: formatHHMMSS(_initialTime),
          );
        }
      },
    );
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  String formatHHMMSS(int seconds) {
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
}
