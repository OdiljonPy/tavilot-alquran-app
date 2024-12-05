// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PremiumState {
  bool get isCheckLoading => throw _privateConstructorUsedError;
  int get selectedPaymentMethod => throw _privateConstructorUsedError;

  /// Create a copy of PremiumState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PremiumStateCopyWith<PremiumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumStateCopyWith<$Res> {
  factory $PremiumStateCopyWith(
          PremiumState value, $Res Function(PremiumState) then) =
      _$PremiumStateCopyWithImpl<$Res, PremiumState>;
  @useResult
  $Res call({bool isCheckLoading, int selectedPaymentMethod});
}

/// @nodoc
class _$PremiumStateCopyWithImpl<$Res, $Val extends PremiumState>
    implements $PremiumStateCopyWith<$Res> {
  _$PremiumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PremiumState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCheckLoading = null,
    Object? selectedPaymentMethod = null,
  }) {
    return _then(_value.copyWith(
      isCheckLoading: null == isCheckLoading
          ? _value.isCheckLoading
          : isCheckLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumStateImplCopyWith<$Res>
    implements $PremiumStateCopyWith<$Res> {
  factory _$$PremiumStateImplCopyWith(
          _$PremiumStateImpl value, $Res Function(_$PremiumStateImpl) then) =
      __$$PremiumStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isCheckLoading, int selectedPaymentMethod});
}

/// @nodoc
class __$$PremiumStateImplCopyWithImpl<$Res>
    extends _$PremiumStateCopyWithImpl<$Res, _$PremiumStateImpl>
    implements _$$PremiumStateImplCopyWith<$Res> {
  __$$PremiumStateImplCopyWithImpl(
      _$PremiumStateImpl _value, $Res Function(_$PremiumStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PremiumState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCheckLoading = null,
    Object? selectedPaymentMethod = null,
  }) {
    return _then(_$PremiumStateImpl(
      isCheckLoading: null == isCheckLoading
          ? _value.isCheckLoading
          : isCheckLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PremiumStateImpl extends _PremiumState {
  const _$PremiumStateImpl(
      {this.isCheckLoading = false, this.selectedPaymentMethod = 0})
      : super._();

  @override
  @JsonKey()
  final bool isCheckLoading;
  @override
  @JsonKey()
  final int selectedPaymentMethod;

  @override
  String toString() {
    return 'PremiumState(isCheckLoading: $isCheckLoading, selectedPaymentMethod: $selectedPaymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumStateImpl &&
            (identical(other.isCheckLoading, isCheckLoading) ||
                other.isCheckLoading == isCheckLoading) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isCheckLoading, selectedPaymentMethod);

  /// Create a copy of PremiumState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumStateImplCopyWith<_$PremiumStateImpl> get copyWith =>
      __$$PremiumStateImplCopyWithImpl<_$PremiumStateImpl>(this, _$identity);
}

abstract class _PremiumState extends PremiumState {
  const factory _PremiumState(
      {final bool isCheckLoading,
      final int selectedPaymentMethod}) = _$PremiumStateImpl;
  const _PremiumState._() : super._();

  @override
  bool get isCheckLoading;
  @override
  int get selectedPaymentMethod;

  /// Create a copy of PremiumState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PremiumStateImplCopyWith<_$PremiumStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
