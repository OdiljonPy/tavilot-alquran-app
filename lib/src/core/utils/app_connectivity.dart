import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnectivity {
  static Future<bool> connectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}