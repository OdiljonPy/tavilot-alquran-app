import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifier/pin_code_notifier.dart';
import '../state/pin_code_state.dart';

final pinCodeProvider =
    StateNotifierProvider.autoDispose<PinCodeNotifier, PinCodeState>(
  (ref) => PinCodeNotifier(),
);
