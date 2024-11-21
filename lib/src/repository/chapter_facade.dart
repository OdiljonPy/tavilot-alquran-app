import 'package:al_quran/src/models/response/single_chapter_response.dart';

import '../handlers/api_result.dart';
import '../models/response/chapter_response.dart';


abstract class ChapterFacade {

  Future<ApiResult<ChapterResponse>> getChapters();

  Future<ApiResult<SingleChapterResponse>> getChapter({required int id});

}
