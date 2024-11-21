// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'for_students_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForStudentsState {
  bool get isCategoriesLoading => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForStudentsStateCopyWith<ForStudentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForStudentsStateCopyWith<$Res> {
  factory $ForStudentsStateCopyWith(
          ForStudentsState value, $Res Function(ForStudentsState) then) =
      _$ForStudentsStateCopyWithImpl<$Res, ForStudentsState>;
  @useResult
  $Res call({bool isCategoriesLoading, List<Category> categories});
}

/// @nodoc
class _$ForStudentsStateCopyWithImpl<$Res, $Val extends ForStudentsState>
    implements $ForStudentsStateCopyWith<$Res> {
  _$ForStudentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCategoriesLoading = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForStudentsStateImplCopyWith<$Res>
    implements $ForStudentsStateCopyWith<$Res> {
  factory _$$ForStudentsStateImplCopyWith(_$ForStudentsStateImpl value,
          $Res Function(_$ForStudentsStateImpl) then) =
      __$$ForStudentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isCategoriesLoading, List<Category> categories});
}

/// @nodoc
class __$$ForStudentsStateImplCopyWithImpl<$Res>
    extends _$ForStudentsStateCopyWithImpl<$Res, _$ForStudentsStateImpl>
    implements _$$ForStudentsStateImplCopyWith<$Res> {
  __$$ForStudentsStateImplCopyWithImpl(_$ForStudentsStateImpl _value,
      $Res Function(_$ForStudentsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCategoriesLoading = null,
    Object? categories = null,
  }) {
    return _then(_$ForStudentsStateImpl(
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$ForStudentsStateImpl extends _ForStudentsState {
  const _$ForStudentsStateImpl(
      {this.isCategoriesLoading = false,
      final List<Category> categories = const []})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isCategoriesLoading;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ForStudentsState(isCategoriesLoading: $isCategoriesLoading, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForStudentsStateImpl &&
            (identical(other.isCategoriesLoading, isCategoriesLoading) ||
                other.isCategoriesLoading == isCategoriesLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCategoriesLoading,
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForStudentsStateImplCopyWith<_$ForStudentsStateImpl> get copyWith =>
      __$$ForStudentsStateImplCopyWithImpl<_$ForStudentsStateImpl>(
          this, _$identity);
}

abstract class _ForStudentsState extends ForStudentsState {
  const factory _ForStudentsState(
      {final bool isCategoriesLoading,
      final List<Category> categories}) = _$ForStudentsStateImpl;
  const _ForStudentsState._() : super._();

  @override
  bool get isCategoriesLoading;
  @override
  List<Category> get categories;

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForStudentsStateImplCopyWith<_$ForStudentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
