import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'for_students_state.dart';

class ForStudentsNotifier extends StateNotifier<ForStudentsState> {
  ForStudentsNotifier(

  ) : super(const ForStudentsState());

  Future<void> fetchCategories(
      BuildContext context, {String? lang}) async {
    state = state.copyWith(
      isCategoriesLoading: true,
    );
    final response = await forStudentsRepository.getCategories(lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(
            isCategoriesLoading: false,
            categories: data.result ?? []
        );
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isCategoriesLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }
}
