import 'package:al_quran/src/models/response/about_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'about_state.freezed.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState({
    @Default(false) bool isAboutLoading,
    About? about,
  }) = _AboutState;

  const AboutState._();
}
