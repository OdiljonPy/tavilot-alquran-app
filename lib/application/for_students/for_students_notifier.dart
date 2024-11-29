import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'for_students_state.dart';

class ForStudentsNotifier extends StateNotifier<ForStudentsState> {
  ForStudentsNotifier() : super(const ForStudentsState());

  void changeIndex(int index, BuildContext context, int id) async{
    state = state.copyWith(selectedIndex: index);
    if(index == 1){
     await fetchPost(context, id: id);
    }
  }

  Future<void> fetchCategories(BuildContext context, {String? lang}) async {
    state = state.copyWith(
      isCategoriesLoading: true,
    );
    final response = await forStudentsRepository.getCategories(lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(
            isCategoriesLoading: false, categories: data.result ?? []);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isCategoriesLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }

  Future<void> fetchPost(BuildContext context,
      {required int id, String? lang}) async {
    state = state.copyWith(
      isPostLoading: true,
    );
    final response = await forStudentsRepository.getPost(id: id, lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(isPostLoading: false, post: data.result);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isPostLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }
}
