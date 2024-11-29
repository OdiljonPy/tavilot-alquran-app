import 'package:al_quran/src/models/response/single_chapter_response.dart';

import '../handlers/api_result.dart';
import '../models/response/chapter_names_response.dart';
import '../models/response/chapter_response.dart';


abstract class ChapterFacade {

  Future<ApiResult<ChapterResponse>> getChapters({String? lang});

  Future<ApiResult<SingleChapterResponse>> getChapter({required int id, String? lang});
  Future<ApiResult<ChapterNames>> getChapterNames({required List<int> ids, String? lang});


}
