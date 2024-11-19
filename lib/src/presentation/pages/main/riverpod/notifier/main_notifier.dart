import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/utils/app_connectivity.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../state/main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier(

  ) : super(const MainState());

  changeIndex(int index, {VoidCallback? onSuccess}) {
    state = state.copyWith(selectIndex: index);
     onSuccess?.call();
  }

  Future<void> fetchChapters(
      BuildContext context) async {
    state = state.copyWith(
      isChapterLoading: true,
    );

    final response =
    await chapterRepository.getChapters();
    response.when(
      success: (data) {
        state = state.copyWith(
            isChapterLoading: false,
            chapters: data.result ?? []
        );
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isChapterLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }




}
