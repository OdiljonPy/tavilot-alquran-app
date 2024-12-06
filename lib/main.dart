import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'infrastructure/translations/codegen_loader.g.dart';
import 'src/app_widget.dart';
import 'src/core/di/dependency_manager.dart';
import 'src/core/utils/utils.dart';
import 'dart:io' show Platform;
Locale? currentLocale;
var navigatorKey = GlobalKey<NavigatorState>();
const kWindowsScheme = 'alquran';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencies();
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    doWhenWindowReady(() {
      const initialSize = Size(1280, 720);
      const minSize = Size(1024, 576);
      // const maxSize = Size(1280, 720);
      // appWindow.maxSize = maxSize;
      appWindow.minSize = minSize;
      appWindow.size = initialSize; //default size
      appWindow.show();
    });
  }

  await LocalStorage.init();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      fallbackLocale: const Locale('ru', 'RU'),
      startLocale: const Locale('ru', 'RU'),
      assetLoader: const CodegenLoader(),
      path: 'assets/tr',

      child: const ProviderScope(child: AppWidget())));}

