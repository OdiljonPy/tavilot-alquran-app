import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:al_quran/src/models/data/bookmark_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../src/core/utils/app_helpers.dart';
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

  setBookMark(int id, int verseId, String name) {
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

      state = state.copyWith(bookmarks: temp);
    } else {
      temp.add(Bookmark(id: id, verseIds: [verseId], name: name));
      state = state.copyWith(bookmarks: temp);
    }
    LocalStorage.setBookmark(state.bookmarks);
  }

  selectJuzId(int index) {
    state = state.copyWith(selectedJuzId: index);
  }

  selectSearchType(int index, BuildContext context) async{
    state = state.copyWith(searchType: index);
    await fetchSearches(context, state.query, i: index);
  }

  changeDrawer() {
    state = state.copyWith(isDrawerOpened: !state.isDrawerOpened);
  }

  selectBookmarkId(int index, int verseId) {
    state = state.copyWith(selectedBookmarkId: index, selectedVerseId: verseId);
  }

  selectSurahId(int index) {
    state = state.copyWith(selectedSurahId: index);
  }

  removeSearch(){
    state = state.copyWith(searchResults: []);
  }

  setSearch(bool result){
    state = state.copyWith(isSearch: result);
  }

  clear() {
    state = state.copyWith(
        juz: null, juzes: [], selectedIndicationType: 0, selectIndex: 0);
  }

  changeIndicationType(int index) {
    state = state.copyWith(selectedIndicationType: index);
  }

  Future<void> fetchJuzes(BuildContext context, {String? lang}) async {
    state = state.copyWith(
      isJuzLoading: true,
    );

    final response = await juzRepository.getJuzes(lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(isJuzLoading: false, juzes: data.result ?? []);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isJuzLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  void scrollToCounter(int index) async {
    final controller = state.autoScrollController;
    if (controller != null) {
      await controller.scrollToIndex(index - 1, preferPosition: AutoScrollPosition.begin);
      controller.highlight(index-1);
    }
  }


  setAutoController(BuildContext c){
    state = state.copyWith(autoScrollController: AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(c).padding.bottom),
        axis: Axis.vertical));
  }

  @override
  void dispose() {
    state.autoScrollController?.dispose();
    super.dispose();
  }

  setQuery(String s){
    state = state.copyWith(query: s);
  }

  Future<void> fetchSearches(BuildContext context, String query,{int? i}) async {
    state = state.copyWith(
      isSearchLoading: true,
    );
    final response = await juzRepository.getSearchResults(query, i ?? state.searchType);
    response.when(
      success: (data) {
        state = state.copyWith(
            isSearchLoading: false, searchResults: data.result ?? []);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isSearchLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  Future<void> fetchJuz(BuildContext context, int id, {String? lang}) async {
    state = state.copyWith(
      isJuzLoading: true,
    );

    final response = await juzRepository.getJuz(id: id, lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(isJuzLoading: false, juz: data);
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isJuzLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  Future<void> fetchSurah(BuildContext context, int id,
      {VoidCallback? onSuccess, String? lang}) async {
    state = state.copyWith(
      isSurahLoading: true,
    );

    final response = await chapterRepository.getChapter(id: id, lang: lang);
    response.when(
      success: (data) {
        state = state.copyWith(isSurahLoading: false, chapter: data.result);
        onSuccess?.call();
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isSurahLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }

  Future<void> fetchChapterNames(BuildContext context,
      {VoidCallback? onSuccess, String? lang}) async {
    state = state.copyWith(
        // isSurahLoading: true,
        );
    final bookmarkIds = state.bookmarks.map((bookmark) => bookmark.id).toList();
    final response =
        await chapterRepository.getChapterNames(ids: bookmarkIds, lang: lang);
    response.when(
      success: (data) {
        final updatedBookmarks = state.bookmarks.map((bookmark) {
          final chapter =
              data.result?.firstWhere((chapter) => chapter.id == bookmark.id);
          return bookmark.copyWith(name: chapter?.name);
        }).toList();
        state = state.copyWith(bookmarks: updatedBookmarks);
        onSuccess?.call();
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isSurahLoading: false);
        AppHelpers.showSnackBar(
          context,
          failure,
        );
      },
    );
  }
}
