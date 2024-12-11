import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src/core/utils/app_helpers.dart';
import 'for_students_state.dart';

class ForStudentsNotifier extends StateNotifier<ForStudentsState> {
  ForStudentsNotifier() : super(const ForStudentsState());

  void changeIndex(int index, BuildContext context,
      {VoidCallback? onSuccess}) async {
    state = state.copyWith(selectedIndex: index);
    onSuccess?.call();
  }

  void selectCategory(int index) {
    state = state.copyWith(selectedCategory: index);
  }

  // Future<void> fetchCategories(BuildContext context, {String? lang}) async {
  //   state = state.copyWith(
  //     isCategoriesLoading: true,
  //   );
  //   final response = await forStudentsRepository.getCategories(lang: lang);
  //   response.when(
  //     success: (data) {
  //       state = state.copyWith(
  //           isCategoriesLoading: false, categories: data.result ?? []);
  //       return;
  //     },
  //     failure: (failure, status) {
  //       state = state.copyWith(isCategoriesLoading: false);
  //       AppHelpers.showSnackBar(
  //         context,
  //         failure,
  //       );
  //     },
  //   );
  // }
  //
  Future<void> fetchPost(BuildContext context,
      {required int id, String? lang}) async {
    state = state.copyWith(
      isPostLoading: true,
    );
    final response = await forStudentsRepository.getPost(id: id,index: state.selectedCategory, lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(isPostLoading: false, category: data.result);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isPostLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  Future<void> fetchCategory(BuildContext context,
      {required int index, String? lang}) async {
    state = state.copyWith(
      isSingleCategoriesLoading: true,
    );
    final response =
        await forStudentsRepository.getSingleCategory(index: index, lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(
            isSingleCategoriesLoading: false,
            categories: data.result ?? []);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isSingleCategoriesLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }
}
