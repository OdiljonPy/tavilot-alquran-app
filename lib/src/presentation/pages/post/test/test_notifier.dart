import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'test_state.dart';

class TestNotifier extends StateNotifier<TestState> {
  TestNotifier(

  ) : super(const TestState());

  addScroll(BuildContext c){
    state = state.copyWith(autoScrollController: AutoScrollController(
        viewportBoundaryGetter: () =>
        Rect.fromLTRB(0, 0, 0, MediaQuery.of(c).padding.bottom),
    axis: Axis.vertical));
  }

  scrollToCounter(int index) async {
    final controller = state.autoScrollController;
    if (controller != null) {
      await controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
      controller.highlight(index);
    }
  }

}
