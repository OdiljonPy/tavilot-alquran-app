import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../models/response/juz_response.dart';
part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isChapterLoading,
    @Default([]) List<Chapter> chapters,
    @Default(0) int selectIndex,
    @Default(false) bool isChapterSearching,
    @Default([]) List<Chapter> searchChapters,
    @Default(null) PageController? pageController,
  }) = _MainState;
  const MainState._();
}
