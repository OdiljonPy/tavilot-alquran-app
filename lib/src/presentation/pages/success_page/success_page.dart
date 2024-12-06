import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:al_quran/src/core/utils/local_storage.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../infrastructure/translations/locale_keys.g.dart';
import '../../styles/style.dart';
@RoutePage()
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.successfullyPaid.tr(),
              style: Style.interSemi(
                size: 30,
                color: Style.primary,
              ),
            ),
            10.verticalSpace,

            Text(
              LocaleKeys.toContinuePleaseLogin.tr(),
              style: Style.interNormal(
                size: 24,
                color: Style.black,
              ),
            ),
            40.verticalSpace,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .4,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return LoginButton(title: LocaleKeys.continueForApp.tr(), onPressed: (){
                    LocalStorage.logOut();
                    ref.read(mainProvider.notifier).deletePageController();
                    context.router.replace(const SplashRoute());
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
