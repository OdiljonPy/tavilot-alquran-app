import 'package:freezed_annotation/freezed_annotation.dart';
part 'premium_state.freezed.dart';

@freezed
class PremiumState with _$PremiumState {
  const factory PremiumState({
    @Default(false) bool isCheckLoading,
    @Default(0) int selectedPaymentMethod,
  }) = _PremiumState;

  const PremiumState._();
}
