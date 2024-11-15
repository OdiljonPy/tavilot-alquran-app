import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../models/models.dart';
part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isProductsLoading,
    @Default(false) bool isMoreProductsLoading,
    @Default(false) bool isShopsLoading,
    @Default(false) bool isBrandsLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(true) bool hasMore,
    @Default(0) int selectIndex,
    @Default('') String query,
    @Default('') String shopQuery,
    @Default('') String categoryQuery,
    @Default('') String brandQuery,

  }) = _MainState;

  const MainState._();
}
