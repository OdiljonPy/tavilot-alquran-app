import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:al_quran/src/models/data/bookmark_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../src/core/utils/local_storage.dart';
import 'surah_state.dart';

class SurahNotifier extends StateNotifier<SurahState> {
  SurahNotifier() : super(const SurahState());

  changeIndex(int index) {
    state = state.copyWith(selectIndex: index);
  }

  setBookmarkFromLocale() {
    final bookmarkList = LocalStorage.getBookmarks();
    state = state.copyWith(bookmarks: bookmarkList);
  }

  setBookMark(int id, int verseId) {
    List<Bookmark> temp = List.from(state.bookmarks);
    if (temp.any((element) => element.id == id)) {
      temp[temp.indexWhere((element) => element.id == id)]
              .verseIds
              .any((e) => e == verseId)
          ? temp[temp.indexWhere((element) => element.id == id)]
              .verseIds
              .remove(verseId)
          : temp[temp.indexWhere((element) => element.id == id)]
              .verseIds
              .add(verseId);

      state = state.copyWith(
        bookmarks: temp
      );
    }
    else {
      temp.add(Bookmark(id: id, verseIds: [verseId]));
      state = state.copyWith(
        bookmarks: temp
      );
    }
    LocalStorage.setBookmark(state.bookmarks);
  }

  selectJuzId(int index) {
    state = state.copyWith(selectedJuzId: index);
  }

  selectSurahId(int index) {
    state = state.copyWith(selectedSurahId: index);
  }

  clear() {
    state = state.copyWith(
        juz: null, juzes: [], selectedIndicationType: 0, selectIndex: 0);
  }

  changeIndicationType(int index) {
    state = state.copyWith(selectedIndicationType: index);
  }

  Future<void> fetchJuzes(BuildContext context) async {
    state = state.copyWith(
      isJuzLoading: true,
    );

    final response = await juzRepository.getJuzes();
    response.when(
      success: (data) {
        state = state.copyWith(isJuzLoading: false, juzes: data.result ?? []);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isJuzLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }

  Future<void> fetchJuz(BuildContext context, int id) async {
    state = state.copyWith(
      isJuzLoading: true,
    );

    final response = await juzRepository.getJuz(id: id);
    response.when(
      success: (data) {
        state = state.copyWith(isJuzLoading: false, juz: data);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isJuzLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }

  Future<void> fetchSurah(BuildContext context, int id) async {
    state = state.copyWith(
      isSurahLoading: true,
    );

    final response = await chapterRepository.getChapter(id: id);
    response.when(
      success: (data) {
        state = state.copyWith(isSurahLoading: false, chapter: data.result);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isSurahLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }
}
