import '../handlers/api_result.dart';
import '../models/response/chapter_response.dart';


abstract class ChapterFacade {

  Future<ApiResult<ChapterResponse>> getChapters();
}
