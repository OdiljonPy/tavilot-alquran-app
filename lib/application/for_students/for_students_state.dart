import 'package:al_quran/src/models/response/categories_response.dart';
import 'package:al_quran/src/models/response/get_categories_response.dart';
import 'package:al_quran/src/models/response/post_response.dart';
import 'package:al_quran/src/models/response/single_category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'for_students_state.freezed.dart';

@freezed
class ForStudentsState with _$ForStudentsState {
  const factory ForStudentsState({
    @Default(false) bool isPostLoading,
    @Default(false) bool isSingleCategoriesLoading,
    @Default(0) int selectedIndex,
    @Default(0) int selectedCategory,
    @Default([]) List<GetCategory> categories,
    GetCategory? category,
  }) = _ForStudentsState;

  const ForStudentsState._();
}
