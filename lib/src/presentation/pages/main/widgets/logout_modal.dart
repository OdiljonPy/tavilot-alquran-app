import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/utils/local_storage.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_router.dart';
import '../../../styles/style.dart';

class LogOutModal extends ConsumerWidget {
  const LogOutModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.areYouSureYouWantLogOut.tr(),
            style: Style.interRegular(),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: LoginButton(
                      bgColor: Style.white,
                      titleColor: Style.secondary,
                      title: LocaleKeys.no.tr(),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
              20.horizontalSpace,
              Expanded(
                  child: LoginButton(
                      title: LocaleKeys.yes.tr(),
                      onPressed: () {
                        LocalStorage.logOut();
                        context.router.popUntilRoot();
                        context.replaceRoute(const SplashRoute());
                      })),
            ],
          )
        ],
      ),
    );
  }
}
