import 'package:al_quran/src/models/response/categories_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isRegistering,
  }) = _RegisterState;

  const RegisterState._();
}
