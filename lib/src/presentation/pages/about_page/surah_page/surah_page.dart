import 'dart:convert';

import 'package:al_quran/application/surah/surah_state.dart';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:al_quran/src/models/response/search_response.dart';
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
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../../application/surah/surah_notifier.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../../core/utils/local_storage.dart';
import '../../../components/flutter_markdown/flutter_markdown.dart';
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
              : Stack(
                children: [
                  state.isSearch ?
                    ListView.separated(
                      controller: state.autoScrollController,
                      itemCount: state.chapter?.verses?.length ?? 0,
                      itemBuilder: (BuildContext context, int j) {
                        return AutoScrollTag(
                          highlightColor: Style.darkGreen,
                          key: ValueKey(j),
                          controller: state.autoScrollController!,
                          index: j,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  20.horizontalSpace,
                                  Container(
                                      height: 30.r,
                                      width: 30.r,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                            AssetImage("assets/png/juzComponent.png")),
                                      ),
                                      child: Align(
                                        alignment: const Alignment(0, -.3),
                                        child: Text(
                                          "${state.chapter?.verses?[j].number}",
                                          style: Style.interRegular(size: 10),
                                        ),
                                      )),
                                  20.horizontalSpace,
                                  Flexible(
                                      child: Text(
                                        "${state.chapter?.verses?[j].textArabic}",
                                        style: Style.regularArabic(size: 20),
                                      )),
                                  20.horizontalSpace,
                                ],
                              ),
                              if (state.selectedIndicationType == 1 ||
                                  state.selectedIndicationType == 2)
                                28.verticalSpace,
                              if ((state.selectedIndicationType == 1 ||
                                  state.selectedIndicationType == 2) &&
                                  (ref
                                      .watch(surahProvider)
                                      .chapter
                                      ?.verses?[j]
                                      .text
                                      ?.isNotEmpty ??
                                      false))
                                Row(
                                  children: [
                                    20.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        "${state.chapter?.verses?[j].text}",
                                        style: Style.interRegular(size: 20),
                                        // textAlign: TextAlign.end,
                                      ),
                                    ),
                                    20.horizontalSpace,
                                  ],
                                ),
                              if (state.selectedIndicationType == 2 &&
                                  (state
                                      .chapter
                                      ?.verses?[j]
                                      .description
                                      ?.isNotEmpty ?? false ))
                                28.verticalSpace,
                              if (state.selectedIndicationType == 2 &&
                                  (state
                                      .chapter
                                      ?.verses?[j]
                                      .description
                                      ?.isNotEmpty ?? false ))
                                Markdown(
                                    selectable: true,
                                    shrinkWrap: true,
                                    imageBuilder: (uri, title, alt) {
                                      final base64String = uri.toString().split(',').last;
                                      try {
                                        final imageBytes = base64Decode(base64String);
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            imageBytes,
                                          ),
                                        );
                                      } catch (e) {
                                        return const Icon(Icons.error, color: Colors.red);
                                      }
                                    },
                                    styleSheet: MarkdownStyleSheet(
                                      p: Style.interRegular(size: 20),
                                      blockquotePadding: const EdgeInsets.all(12.0),
                                      textAlign: WrapAlignment.center,
                                    ),
                                    data:
                                    state.chapter?.verses?[j].description ??
                                        ""),
                              14.verticalSpace
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 1,
                          color: Style.secondary,
                        );
                      },
                    ):
                  ListView(
                      children: [
                        Container(
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
                      ]
                    ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width/6,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.searchResults.length,
                        padding: REdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemBuilder: (context, index) {
                          return SearchItem(
                            searchResult: state.searchResults[index],
                            onTap: () {
                              ref.read(surahProvider.notifier).fetchSurah(context, state.searchResults[index].chapterId ??0, onSuccess: (){
                                ref.read(surahProvider.notifier)..setSearch(true)..scrollToCounter(state.searchResults[index].number ?? 0);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  if(state.isSearch)
                  Align(
                    alignment: const Alignment(-.96,-.95),
                    child: CustomBackButton(onTap: (){
                      ref.read(surahProvider.notifier).setSearch(false);
                    })
                  ),
                ],
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

class SearchItem extends StatelessWidget {
  final SearchData searchResult;
  final VoidCallback onTap;

  const SearchItem({
    super.key,
    required this.searchResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Style.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Container(

          constraints: BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).width / 6),
          padding: REdgeInsets.all(5),
          child: Text(
            "${searchResult.chapterName}, ${searchResult.number} - ${LocaleKeys.verse.tr()}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Style.interNormal(
                color: Style.black, size: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}

