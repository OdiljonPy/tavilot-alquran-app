import 'package:al_quran/application/premium/premium_provider.dart';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/styles/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main/riverpod/provider/main_provider.dart';

class PremiumPage extends ConsumerWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    40.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 220.r,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/png/premiumBackground.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                          child: Text(LocaleKeys.premiumVersion.tr(),
                              style: Style.interSemi(
                                  size: 36, color: Style.primary))),
                    ),
                    20.verticalSpace,
                    Text(
                      LocaleKeys.withPremiumUWillGEt.tr(),
                      style: Style.interRegular(color: Style.black, size: 24),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.chooseForSell.tr(),
                            style:
                                Style.interNormal(size: 22, color: Style.black),
                          ),
                          20.horizontalSpace,
                          ButtonEffect(
                              onTap: ()=> ref.read(premiumProvider.notifier).setSelectedPaymentMethod(0),
                              child: Container(
                                width: 150.r,
                                  height: 100.r,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: ref.watch(premiumProvider).selectedPaymentMethod == 0? Border.all(color: Style.primary): null,
                                  ),
                                  child: Image.asset("assets/png/payme.png"))),
                          27.horizontalSpace,
                          ButtonEffect(
                              onTap: ()=> ref.read(premiumProvider.notifier).setSelectedPaymentMethod(1),
                              child: Container(
                                  width: 150.r,
                                  height: 100.r,
                                padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: ref.watch(premiumProvider).selectedPaymentMethod == 1? Border.all(color: Style.primary): null,
                                  ),
                                  child: Image.asset("assets/png/click.png"))),
                        ],
                      ),
                    ),
                    36.verticalSpace,
                    LoginButton(
                        isLoading: ref.watch(premiumProvider).isCheckLoading,
                        height: 80.r,
                        titleColor: Style.primary,
                        bgColor: Style.white,
                        title: LocaleKeys.buy.tr(),
                        onPressed: () async {
                          ref.read(premiumProvider.notifier).fetchCheck(context);
                        }),
                    80.verticalSpace,
                  ],
                )),
            const Spacer(),
          ],
        ),
        Positioned(
            top: 25.r,
            left: 70.r,
            child: CustomBackButton(onTap: () {
              ref.read(mainProvider.notifier).changeIndex(0);
            }))
      ],
    );
  }
}
