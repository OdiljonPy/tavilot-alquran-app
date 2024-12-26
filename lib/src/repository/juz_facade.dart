import 'package:al_quran/src/models/response/juz_list_response.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:al_quran/src/models/response/search_response.dart';
import '../handlers/api_result.dart';


abstract class JuzFacade {
  Future<ApiResult<JuzListResponse>> getJuzes({String? lang});
  Future<ApiResult<JuzResponse>> getJuz({required int id, String? lang});
  Future<ApiResult<SearchResponse>> getSearchResults(String query);

}
