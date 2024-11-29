import 'package:al_quran/src/models/models.dart';
import 'package:al_quran/src/models/response/post_response.dart';

import '../handlers/api_result.dart';
import '../models/response/categories_response.dart';

abstract class ForStudentsFacade {
  Future<ApiResult<CategoriesResponse>> getCategories({String? lang});

  Future<ApiResult<PostResponse>> getPost({required int id,String? lang});

  Future<ApiResult<SingleCategoryResponse>> getCategory({required int id,String? lang});

}
