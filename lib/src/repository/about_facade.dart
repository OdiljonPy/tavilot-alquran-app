import 'package:al_quran/src/models/response/about_response.dart';
import '../handlers/api_result.dart';

abstract class AboutFacade {
  Future<ApiResult<AboutResponse>> getAboutUs({String? lang});
}
