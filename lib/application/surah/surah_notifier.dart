import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'surah_state.dart';

class SurahNotifier extends StateNotifier<SurahState> {
  SurahNotifier() : super(const SurahState());

  changeIndex(int index) {
    state = state.copyWith(selectIndex: index);
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
