import 'dart:convert';
import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../src/core/utils/utils.dart';
import 'premium_state.dart';

class PremiumNotifier extends StateNotifier<PremiumState> {
  PremiumNotifier() : super(const PremiumState());

  Future<void> fetchCheck(
    BuildContext context,
  ) async {
    state = state.copyWith(
      isCheckLoading: true,
    );
    final response = await authRepository.checkSubscription();
    response.when(
      success: (data) async {
        state = state.copyWith(
          isCheckLoading: false,
        );
        if(state.selectedPaymentMethod ==0){
          String encodedQuery = base64.encode(utf8.encode(
              "m=6746cfafd33fb8548ceca73e;ac.user_id=${data.userId};a=${data.praysPayme}; c=alquran://success"));
          await launchUrlString("https://checkout.paycom.uz/$encodedQuery");
        }else{
          // if(data.result == true){
          //   return;
          // }
          await launchUrlString(
              "https://my.click.uz/services/pay?service_id=39892&merchant_id=32039&amount=${data.praysClick}&transaction_param=${data.userId}&return_url=alquran://success}");
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isCheckLoading: false);
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(failure),
        );
      },
    );
  }

  setSelectedPaymentMethod(int index) {
    state = state.copyWith(selectedPaymentMethod: index);
  }
}
