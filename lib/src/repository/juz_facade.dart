import 'package:al_quran/src/models/response/juz_list_response.dart';
import 'package:al_quran/src/models/response/juz_response.dart';
import '../handlers/api_result.dart';


abstract class JuzFacade {
  Future<ApiResult<JuzListResponse>> getJuzes();
  Future<ApiResult<JuzResponse>> getJuz({required int id});

}
