import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'test_notifier.dart';
import 'test_state.dart';


final testProvider = StateNotifierProvider<TestNotifier, TestState>(
  (ref) => TestNotifier(),
);
