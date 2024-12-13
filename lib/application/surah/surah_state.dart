import 'package:al_quran/src/models/data/bookmark_data.dart';
import 'package:al_quran/src/models/response/juz_list_response.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:al_quran/src/models/response/single_chapter_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'surah_state.freezed.dart';

@freezed
class SurahState with _$SurahState {
  const factory SurahState({
    @Default(false) bool isJuzLoading,
    @Default(false) bool isSurahLoading,
    @Default(false) bool isDrawerOpened,
    @Default(0) int selectedSurahId,
    @Default(0) int selectedJuzId,
    @Default(0) int selectedBookmarkId,
    @Default(0) int selectIndex,
    @Default(0) int selectedVerseId,
    @Default(0) int selectedIndicationType,
    @Default([]) List<JuzListItem> juzes,
    @Default([]) List<Bookmark> bookmarks,
    JuzResponse? juz,
    SingleChapter? chapter,
  }) = _SurahState;

  const SurahState._();
}
