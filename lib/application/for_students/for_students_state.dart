import 'package:al_quran/src/models/response/categories_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'for_students_state.freezed.dart';

@freezed
class ForStudentsState with _$ForStudentsState {
  const factory ForStudentsState({
    @Default(false) bool isCategoriesLoading,
    @Default([]) List<Category> categories,
  }) = _ForStudentsState;

  const ForStudentsState._();
}
