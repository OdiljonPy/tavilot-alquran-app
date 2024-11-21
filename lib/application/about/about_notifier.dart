import 'package:al_quran/src/core/di/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'about_state.dart';

class AboutNotifier extends StateNotifier<AboutState> {
  AboutNotifier(

  ) : super(const AboutState());

  Future<void> fetchAbout(
      BuildContext context) async {
    state = state.copyWith(
      isAboutLoading: true,
    );
    final response = await aboutRepository.getAboutUs();
    response.when(
      success: (data) {
        state = state.copyWith(
            isAboutLoading: false,
            about: data.result
        );
        return;
      },
      failure: (failure, status) {
        state = state.copyWith(isAboutLoading: false);
        // AppHelpers.errorSnackBar(
        //     context: context, message: failure.toString());
      },
    );
  }
}
