import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    @Default(false) bool hasFocus,
    @Default(false) bool isAcceptTerms,
    @Default(false) bool isSuccess,
    @Default(false) bool showPassword,
    @Default(false) bool isMinimumLength,
    @Default(false) bool isMinimumNum,
    @Default(false) bool isMinimumChar,
    @Default(false) bool isPasswordInvalid,
    @Default('') String phone,
    @Default('') String password,
    @Default('') String otpCode,
    String? otpKey,
  }) = _RegisterState;

  const RegisterState._();
}