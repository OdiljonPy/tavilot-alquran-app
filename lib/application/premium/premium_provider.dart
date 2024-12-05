import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'premium_notifier.dart';
import 'premium_state.dart';


final premiumProvider = StateNotifierProvider<PremiumNotifier, PremiumState>(
  (ref) => PremiumNotifier(),
);
