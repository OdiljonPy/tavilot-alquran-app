import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../state/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState()) {
    fetchLocale();
  }

  Future<void> fetchLocale() async {
    final lang = LocalStorage.getLanguage()?.locale ?? 'ru';
    state = state.copyWith(lang: lang.isEmpty ? 'ru' : lang);
  }

  Future<void> changeLocale(LanguageData? language) async {
    await LocalStorage.setActiveLocale(language?.locale);
    state = state.copyWith(lang: language?.locale ?? 'ru');
  }
}
