import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(

  ) : super(const RegisterState());

  // Future<void> fetchCategories(
  //     BuildContext context) async {
  //   state = state.copyWith(
  //     isCategoriesLoading: true,
  //   );
  //   final response = await forStudentsRepository.getCategories();
  //   response.when(
  //     success: (data) {
  //       state = state.copyWith(
  //           isCategoriesLoading: false,
  //           categories: data.result ?? []
  //       );
  //       return;
  //     },
  //     failure: (failure, status) {
  //       state = state.copyWith(isCategoriesLoading: false);
  //       // AppHelpers.errorSnackBar(
  //       //     context: context, message: failure.toString());
  //     },
  //   );
  // }
}
