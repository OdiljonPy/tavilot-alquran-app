import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../state/main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier(

  ) : super(const MainState());

  changeIndex(int index, {VoidCallback? onSuccess}) {
    state = state.copyWith(selectIndex: index);
    if(state.pageController != null){
      state.pageController?.jumpToPage(index);
    }
    changeQuery("");
    onSuccess?.call();
  }

  deletePageController(){
    state.pageController?.dispose();
    state = state.copyWith(pageController: null);
  }

  setPageController(){
    state = state.copyWith(pageController: PageController());
  }

  Future<void> fetchChapters(
      BuildContext context, {String? lang}) async {
    state = state.copyWith(
      isChapterLoading: true,
    );

    final response =
    await chapterRepository.getChapters(lang: lang);
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
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  changeQuery(String query) {
    if (query.isNotEmpty) {
      state = state.copyWith(isChapterSearching: true);
      List<Chapter> list = [];
      for (int i = 0; i < state.chapters.length; i++) {
        if (state.chapters[i].name
            ?.toLowerCase()
            .startsWith(query.toLowerCase()) ??
            false) {
          list.add(state.chapters[i]);
        }
      }
      state = state.copyWith(searchChapters: list);
    } else {
      state = state.copyWith(isChapterSearching: false, searchChapters: []);
    }
  }
}
