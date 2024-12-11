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
  bool get isPostLoading => throw _privateConstructorUsedError;
  bool get isSingleCategoriesLoading => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  int get selectedCategory => throw _privateConstructorUsedError;
  List<GetCategory> get categories => throw _privateConstructorUsedError;
  GetCategory? get category => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isPostLoading,
      bool isSingleCategoriesLoading,
      int selectedIndex,
      int selectedCategory,
      List<GetCategory> categories,
      GetCategory? category});
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
    Object? isPostLoading = null,
    Object? isSingleCategoriesLoading = null,
    Object? selectedIndex = null,
    Object? selectedCategory = null,
    Object? categories = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      isPostLoading: null == isPostLoading
          ? _value.isPostLoading
          : isPostLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSingleCategoriesLoading: null == isSingleCategoriesLoading
          ? _value.isSingleCategoriesLoading
          : isSingleCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<GetCategory>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GetCategory?,
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
  $Res call(
      {bool isPostLoading,
      bool isSingleCategoriesLoading,
      int selectedIndex,
      int selectedCategory,
      List<GetCategory> categories,
      GetCategory? category});
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
    Object? isPostLoading = null,
    Object? isSingleCategoriesLoading = null,
    Object? selectedIndex = null,
    Object? selectedCategory = null,
    Object? categories = null,
    Object? category = freezed,
  }) {
    return _then(_$ForStudentsStateImpl(
      isPostLoading: null == isPostLoading
          ? _value.isPostLoading
          : isPostLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSingleCategoriesLoading: null == isSingleCategoriesLoading
          ? _value.isSingleCategoriesLoading
          : isSingleCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<GetCategory>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GetCategory?,
    ));
  }
}

/// @nodoc

class _$ForStudentsStateImpl extends _ForStudentsState {
  const _$ForStudentsStateImpl(
      {this.isPostLoading = false,
      this.isSingleCategoriesLoading = false,
      this.selectedIndex = 0,
      this.selectedCategory = 0,
      final List<GetCategory> categories = const [],
      this.category})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isPostLoading;
  @override
  @JsonKey()
  final bool isSingleCategoriesLoading;
  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final int selectedCategory;
  final List<GetCategory> _categories;
  @override
  @JsonKey()
  List<GetCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final GetCategory? category;

  @override
  String toString() {
    return 'ForStudentsState(isPostLoading: $isPostLoading, isSingleCategoriesLoading: $isSingleCategoriesLoading, selectedIndex: $selectedIndex, selectedCategory: $selectedCategory, categories: $categories, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForStudentsStateImpl &&
            (identical(other.isPostLoading, isPostLoading) ||
                other.isPostLoading == isPostLoading) &&
            (identical(other.isSingleCategoriesLoading,
                    isSingleCategoriesLoading) ||
                other.isSingleCategoriesLoading == isSingleCategoriesLoading) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isPostLoading,
      isSingleCategoriesLoading,
      selectedIndex,
      selectedCategory,
      const DeepCollectionEquality().hash(_categories),
      category);

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
      {final bool isPostLoading,
      final bool isSingleCategoriesLoading,
      final int selectedIndex,
      final int selectedCategory,
      final List<GetCategory> categories,
      final GetCategory? category}) = _$ForStudentsStateImpl;
  const _ForStudentsState._() : super._();

  @override
  bool get isPostLoading;
  @override
  bool get isSingleCategoriesLoading;
  @override
  int get selectedIndex;
  @override
  int get selectedCategory;
  @override
  List<GetCategory> get categories;
  @override
  GetCategory? get category;

  /// Create a copy of ForStudentsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForStudentsStateImplCopyWith<_$ForStudentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
