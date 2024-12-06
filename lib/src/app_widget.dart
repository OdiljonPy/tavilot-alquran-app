import 'dart:async';
import 'package:al_quran/src/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main.dart';
import 'core/routes/app_router.dart';
import 'presentation/components/components.dart';
import 'presentation/theme/light_theme.dart';
import 'presentation/theme/theme/theme.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _rootRouter = AppRouter();



  @override
  Widget build(BuildContext context) {
    currentLocale = context.locale;
    return FutureBuilder(
      future: Future.wait({
        AppTheme.create,
      }),
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.hasData){
          final AppTheme theme = snapshot.data?[0];
          return ScreenUtilInit(
            designSize: const Size(1194, 900),
            builder: (context, child) {
              return ChangeNotifierProvider(
                create: (BuildContext context) => theme,
                child: MaterialApp.router(
                  theme: lightTheme(),
                  scrollBehavior: CustomScrollBehavior(),
                  debugShowCheckedModeBanner: false,
                  routerConfig: _rootRouter.config(),
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  color: Style.white,
                  builder: (context, child) => ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: child ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          );
        }else{
          return const SizedBox.shrink();
        }
      }
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}