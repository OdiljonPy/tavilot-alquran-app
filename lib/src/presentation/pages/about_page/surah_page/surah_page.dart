import 'package:al_quran/application/surah/surah_state.dart';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/components/helper/blur_wrap.dart';
import 'package:al_quran/src/presentation/pages/about_page/surah_page/widgets/bookmark_indicator_list.dart';
import 'package:al_quran/src/presentation/pages/about_page/surah_page/widgets/chapter_indicator_list.dart';
import 'package:al_quran/src/presentation/pages/about_page/surah_page/widgets/juz_indicator_list.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../application/surah/surah_notifier.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../../core/utils/local_storage.dart';
import '../../../styles/style.dart';
import 'widgets/chapter_list.dart';
import 'widgets/juz_list.dart';

class SurahPage extends ConsumerStatefulWidget {
  const SurahPage({super.key});

  @override
  ConsumerState<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends ConsumerState<SurahPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: state.isDrawerOpened ? 3 : 1,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Style.white,
                border: Border(
                  right: BorderSide(color: Style.secondary, width: 1.r),
                ),
              ),
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              child: Column(
                children: [
                  25.verticalSpace,
                  _selectType(state, notifier),
                  40.verticalSpace,
                  state.selectIndex == 0 ? const ChapterList() : const JuzList()
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 11,
          child: ref.watch(surahProvider).isJuzLoading ||
                  ref.watch(surahProvider).isSurahLoading
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: const Loading())
              : SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.sizeOf(context).height),
                    color: Style.white,
                    child: Column(
                      children: [
                        _selectTypeOfIndication(state, notifier),
                        if (state.selectIndex == 0)
                          const ChapterIndicatorList()
                        else if (state.selectIndex == 1)
                          const JuzIndicatorList()
                        else
                          const BookmarkIndicatorList()
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _selectType(SurahState state, SurahNotifier notifier) {
    return state.isDrawerOpened
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonEffect(
                onTap: () {
                  notifier.changeIndex(0);
                },
                child: Text(LocaleKeys.chapters.tr(),
                    style: Style.interRegular(
                      decorationColor: Style.primary,
                      size: 14,
                      color: state.selectIndex == 0 ? Style.black : Style.hint,
                      textDecoration: state.selectIndex == 0
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    )),
              ),
              30.horizontalSpace,
              ButtonEffect(
                onTap: () {
                  notifier.changeIndex(1);
                  if (ref.watch(surahProvider).selectedJuzId == 0) {
                    notifier.selectJuzId(1);
                  }
                },
                child: Text(LocaleKeys.juzes.tr(),
                    style: Style.interRegular(
                      decorationColor: Style.primary,
                      size: 14,
                      color: state.selectIndex == 1 ? Style.black : Style.hint,
                      textDecoration: state.selectIndex == 1
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    )),
              ),
              30.horizontalSpace,
              ButtonEffect(
                  onTap: () {
                    notifier.changeDrawer();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_double_arrow_left,
                        size: 14.r,
                        color: Style.primary,
                      ),
                      Text(
                        LocaleKeys.close.tr(),
                        style:
                            Style.interNormal(size: 14, color: Style.primary),
                      )
                    ],
                  ))
            ],
          )
        : ButtonEffect(
            onTap: () {
              notifier.changeDrawer();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 14.r,
                  color: Style.primary,
                ),
                Text(
                  LocaleKeys.open.tr(),
                  style: Style.interNormal(size: 14, color: Style.primary),
                )
              ],
            ),
          );
  }

  Widget _selectTypeOfIndication(SurahState state, SurahNotifier notifier) {
    return Container(
      height: 45.r,
      margin: REdgeInsets.symmetric(vertical: 20),
      padding: REdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Style.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonEffect(
            onTap: () {
              notifier.changeIndicationType(0);
            },
            child: Container(
              height: 36.r,
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 5),
              decoration: BoxDecoration(
                color: state.selectedIndicationType == 0
                    ? Style.primary
                    : Style.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                LocaleKeys.arabic.tr(),
                style: Style.interRegular(
                    size: 16,
                    color: state.selectedIndicationType == 0
                        ? Style.white
                        : Style.black),
              ),
            ),
          ),
          ButtonEffect(
            onTap: () {
              notifier.changeIndicationType(1);
            },
            child: Container(
              height: 36.r,
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 5),
              decoration: BoxDecoration(
                color: state.selectedIndicationType == 1
                    ? Style.primary
                    : Style.transparent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                LocaleKeys.translate.tr(),
                style: Style.interRegular(
                    size: 16,
                    color: state.selectedIndicationType == 1
                        ? Style.white
                        : Style.black),
              ),
            ),
          ),
          BlurWrap(
            blur: LocalStorage.getUserRate() != 2 ? 10 : 0,
            radius: BorderRadius.circular(20.r),
            child: ButtonEffect(
              onTap: () {
                if (LocalStorage.getUserRate() == 2) {
                  notifier.changeIndicationType(2);
                } else {
                  if (LocalStorage.getToken().isNotEmpty) {
                    ref.read(mainProvider.notifier).changeIndex(4);
                  } else {
                    LocalStorage.logOut();
                    context.router.popUntilRoot();
                    context.replaceRoute(const LoginRoute());
                  }
                }
              },
              child: Container(
                height: 36.r,
                padding: REdgeInsets.symmetric(horizontal: 24, vertical: 5),
                decoration: BoxDecoration(
                  color: state.selectedIndicationType == 2
                      ? Style.primary
                      : Style.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.surahDescription.tr(),
                      style: Style.interRegular(
                          size: 16,
                          color: state.selectedIndicationType == 2
                              ? Style.white
                              : Style.black),
                    ),
                    if (LocalStorage.getUserRate() != 2) 8.horizontalSpace,
                    if (LocalStorage.getUserRate() != 2)
                      SvgPicture.asset(
                        "assets/svg/lock.svg",
                        height: 24.r,
                        width: 24.r,
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
