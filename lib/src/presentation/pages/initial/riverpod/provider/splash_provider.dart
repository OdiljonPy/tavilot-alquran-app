import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifier/splash_notifier.dart';
import '../state/splash_state.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(),
);
