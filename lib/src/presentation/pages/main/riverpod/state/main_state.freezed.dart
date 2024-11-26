// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  bool get isChapterLoading => throw _privateConstructorUsedError;
  List<Chapter> get chapters => throw _privateConstructorUsedError;
  int get selectIndex => throw _privateConstructorUsedError;
  bool get isChapterSearching => throw _privateConstructorUsedError;
  List<Chapter> get searchChapters => throw _privateConstructorUsedError;
  PageController? get pageController => throw _privateConstructorUsedError;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {bool isChapterLoading,
      List<Chapter> chapters,
      int selectIndex,
      bool isChapterSearching,
      List<Chapter> searchChapters,
      PageController? pageController});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChapterLoading = null,
    Object? chapters = null,
    Object? selectIndex = null,
    Object? isChapterSearching = null,
    Object? searchChapters = null,
    Object? pageController = freezed,
  }) {
    return _then(_value.copyWith(
      isChapterLoading: null == isChapterLoading
          ? _value.isChapterLoading
          : isChapterLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isChapterSearching: null == isChapterSearching
          ? _value.isChapterSearching
          : isChapterSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchChapters: null == searchChapters
          ? _value.searchChapters
          : searchChapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
      pageController: freezed == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isChapterLoading,
      List<Chapter> chapters,
      int selectIndex,
      bool isChapterSearching,
      List<Chapter> searchChapters,
      PageController? pageController});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChapterLoading = null,
    Object? chapters = null,
    Object? selectIndex = null,
    Object? isChapterSearching = null,
    Object? searchChapters = null,
    Object? pageController = freezed,
  }) {
    return _then(_$MainStateImpl(
      isChapterLoading: null == isChapterLoading
          ? _value.isChapterLoading
          : isChapterLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isChapterSearching: null == isChapterSearching
          ? _value.isChapterSearching
          : isChapterSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchChapters: null == searchChapters
          ? _value._searchChapters
          : searchChapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
      pageController: freezed == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController?,
    ));
  }
}

/// @nodoc

class _$MainStateImpl extends _MainState {
  const _$MainStateImpl(
      {this.isChapterLoading = false,
      final List<Chapter> chapters = const [],
      this.selectIndex = 0,
      this.isChapterSearching = false,
      final List<Chapter> searchChapters = const [],
      this.pageController = null})
      : _chapters = chapters,
        _searchChapters = searchChapters,
        super._();

  @override
  @JsonKey()
  final bool isChapterLoading;
  final List<Chapter> _chapters;
  @override
  @JsonKey()
  List<Chapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  @JsonKey()
  final int selectIndex;
  @override
  @JsonKey()
  final bool isChapterSearching;
  final List<Chapter> _searchChapters;
  @override
  @JsonKey()
  List<Chapter> get searchChapters {
    if (_searchChapters is EqualUnmodifiableListView) return _searchChapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchChapters);
  }

  @override
  @JsonKey()
  final PageController? pageController;

  @override
  String toString() {
    return 'MainState(isChapterLoading: $isChapterLoading, chapters: $chapters, selectIndex: $selectIndex, isChapterSearching: $isChapterSearching, searchChapters: $searchChapters, pageController: $pageController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isChapterLoading, isChapterLoading) ||
                other.isChapterLoading == isChapterLoading) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.selectIndex, selectIndex) ||
                other.selectIndex == selectIndex) &&
            (identical(other.isChapterSearching, isChapterSearching) ||
                other.isChapterSearching == isChapterSearching) &&
            const DeepCollectionEquality()
                .equals(other._searchChapters, _searchChapters) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isChapterLoading,
      const DeepCollectionEquality().hash(_chapters),
      selectIndex,
      isChapterSearching,
      const DeepCollectionEquality().hash(_searchChapters),
      pageController);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState extends MainState {
  const factory _MainState(
      {final bool isChapterLoading,
      final List<Chapter> chapters,
      final int selectIndex,
      final bool isChapterSearching,
      final List<Chapter> searchChapters,
      final PageController? pageController}) = _$MainStateImpl;
  const _MainState._() : super._();

  @override
  bool get isChapterLoading;
  @override
  List<Chapter> get chapters;
  @override
  int get selectIndex;
  @override
  bool get isChapterSearching;
  @override
  List<Chapter> get searchChapters;
  @override
  PageController? get pageController;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
