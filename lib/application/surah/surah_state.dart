import 'package:al_quran/src/models/data/bookmark_data.dart';
import 'package:al_quran/src/models/response/juz_list_response.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:al_quran/src/models/response/search_response.dart';
import 'package:al_quran/src/models/response/single_chapter_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
part 'surah_state.freezed.dart';

@freezed
class SurahState with _$SurahState {
  const factory SurahState({
    @Default(false) bool isJuzLoading,
    @Default(false) bool isSurahLoading,
    @Default(true) bool isDrawerOpened,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isSearch,
    @Default(0) int selectedSurahId,
    @Default(0) int selectedJuzId,
    @Default(0) int selectedBookmarkId,
    @Default(0) int selectIndex,
    @Default(0) int selectedVerseId,
    @Default(0) int selectedIndicationType,
    @Default(2) int searchType,
    @Default([]) List<JuzListItem> juzes,
    @Default([]) List<Bookmark> bookmarks,
    @Default([]) List<SearchData> searchResults,
    @Default("") String query,
    AutoScrollController? autoScrollController,
    JuzResponse? juz,
    SingleChapter? chapter,
  }) = _SurahState;

  const SurahState._();
}
