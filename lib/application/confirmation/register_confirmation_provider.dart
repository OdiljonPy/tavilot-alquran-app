import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'register_confirmation_notifier.dart';
import 'register_confirmation_state.dart';

final registerConfirmationProvider = StateNotifierProvider<
    RegisterConfirmationNotifier, RegisterConfirmationState>(
  (ref) => RegisterConfirmationNotifier(
  ),
);
