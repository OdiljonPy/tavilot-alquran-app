import '../handlers/api_result.dart';
import '../models/response/categories_response.dart';

abstract class ForStudentsFacade {
  Future<ApiResult<CategoriesResponse>> getCategories({String? lang});
}
