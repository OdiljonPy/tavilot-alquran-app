import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_confirmation_state.freezed.dart';

@freezed
class RegisterConfirmationState with _$RegisterConfirmationState {
  const factory RegisterConfirmationState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(2) int isAllowed,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isCodeError,
    @Default(false) bool isConfirm,
    @Default('') String confirmCode,
    @Default(2) int confirmCodeCount,
    String? otpKey,
    @Default('00:60') String timerText,
  }) = _RegisterConfirmationState;

  const RegisterConfirmationState._();
}