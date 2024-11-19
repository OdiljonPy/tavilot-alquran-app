import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'surah_notifier.dart';
import 'surah_state.dart';


final surahProvider = StateNotifierProvider<SurahNotifier, SurahState>(
  (ref) => SurahNotifier(),
);
