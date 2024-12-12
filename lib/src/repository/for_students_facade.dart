import 'package:al_quran/src/models/models.dart';
import 'package:al_quran/src/models/response/get_categories_response.dart';
import 'package:al_quran/src/models/response/get_single_category_response.dart';

import '../handlers/api_result.dart';
import '../models/response/categories_response.dart';

abstract class ForStudentsFacade {
  Future<ApiResult<CategoriesResponse>> getCategories({String? lang});

  Future<ApiResult<GetCategoryResponse>> getSingleCategory({String? lang, required int index});

  Future<ApiResult<GetSingleCategory>> getPost({required int id, required int index,String? lang});

  Future<ApiResult<SingleCategoryResponse>> getCategory({required int id,String? lang});

}
