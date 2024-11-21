import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'about_notifier.dart';
import 'about_state.dart';


final aboutProvider = StateNotifierProvider<AboutNotifier, AboutState>(
  (ref) => AboutNotifier(),
);
