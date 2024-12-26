import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
part 'test_state.freezed.dart';

@freezed
class TestState with _$TestState {
  const factory TestState({
    @Default(false) bool isTestLoading,
    AutoScrollController? autoScrollController,
  }) = _TestState;

  const TestState._();
}
