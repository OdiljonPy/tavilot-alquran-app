import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/presentation/components/buttons/bookmark.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/components/helper/blur_wrap.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../../core/utils/local_storage.dart';
import '../../../styles/style.dart';

class SurahPage extends ConsumerStatefulWidget {
  const SurahPage({super.key});

  @override
  ConsumerState<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends ConsumerState<SurahPage> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  void scrollToIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Style.white,
                border: Border(
                  right: BorderSide(color: Style.primary, width: 1.r),
                ),
              ),
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              child: Column(
                children: [
                  25.verticalSpace,
                  Row(
                    children: [
                      18.horizontalSpace,
                      ButtonEffect(
                        onTap: () {
                          notifier.changeIndex(0);
                        },
                        child: Text(LocaleKeys.chapters.tr(),
                            style: Style.interRegular(
                              decorationColor: Style.primary,
                              size: 14,
                              color: state.selectIndex == 0
                                  ? Style.black
                                  : Style.hint,
                              textDecoration: state.selectIndex == 0
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            )),
                      ),
                      20.horizontalSpace,
                      ButtonEffect(
                        onTap: () {
                          notifier.changeIndex(1);
                        },
                        child: Text(LocaleKeys.juzes.tr(),
                            style: Style.interRegular(
                              decorationColor: Style.primary,
                              size: 14,
                              color: state.selectIndex == 1
                                  ? Style.black
                                  : Style.hint,
                              textDecoration: state.selectIndex == 1
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            )),
                      ),
                      20.horizontalSpace,
                      ButtonEffect(
                        onTap: () {
                          notifier.changeIndex(2);
                        },
                        child: Text(LocaleKeys.bookmarks.tr(),
                            style: Style.interRegular(
                              decorationColor: Style.primary,
                              size: 14,
                              color: state.selectIndex == 2
                                  ? Style.black
                                  : Style.hint,
                              textDecoration: state.selectIndex == 2
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            )),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  state.selectIndex == 0
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: ref.watch(mainProvider).chapters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ButtonEffect(
                              onTap: () {
                                notifier
                                  ..selectSurahId(index + 1)
                                  ..fetchSurah(context, index + 1);
                              },
                              child: Container(
                                color: state.selectedSurahId == index + 1
                                    ? Style.backgroundColor
                                    : null,
                                height: 60.r,
                                padding: REdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.r,
                                      width: 50.r,
                                      decoration: BoxDecoration(
                                        color: Style.white,
                                        border: Border.all(
                                            color: Style.secondary, width: 1.r),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "${index + 1}",
                                        style: Style.interRegular(size: 10),
                                      )),
                                    ),
                                    14.horizontalSpace,
                                    Expanded(
                                      child: SizedBox(
                                        height: 50.r,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${ref.watch(mainProvider).chapters[index].name}",
                                                  style: Style.interRegular(
                                                      size: 18),
                                                ),
                                                Text(
                                                  "${ref.watch(mainProvider).chapters[index].verseNumber == 0 ? "Маккий" : "Маданий"}, ${ref.watch(mainProvider).chapters[index].verseNumber} оят",
                                                  style: Style.interRegular(
                                                      size: 8),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${ref.watch(mainProvider).chapters[index].nameArabic}",
                                              style:
                                                  Style.interRegular(size: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 14.verticalSpace;
                          },
                        )
                      : state.selectIndex == 1
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemCount: ref.watch(surahProvider).juzes.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ButtonEffect(
                                  onTap: () {
                                    notifier.selectJuzId(index + 1);
                                    notifier.fetchJuz(context, index + 1);
                                  },
                                  child: Container(
                                    height: 60.r,
                                    color: state.selectedJuzId == index + 1
                                        ? Style.backgroundColor
                                        : null,
                                    padding: REdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50.r,
                                          width: 50.r,
                                          decoration: BoxDecoration(
                                            color: Style.white,
                                            border: Border.all(
                                                color: Style.secondary,
                                                width: 1.r),
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                          ),
                                          child: Center(
                                              child: Text(
                                            ref
                                                .watch(surahProvider)
                                                .juzes[index]
                                                .number
                                                .toString(),
                                            style: Style.interRegular(size: 10),
                                          )),
                                        ),
                                        14.horizontalSpace,
                                        SizedBox(
                                          height: 50.r,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${ref.watch(surahProvider).juzes[index].number} - жуз",
                                                style: Style.interRegular(
                                                    size: 18),
                                              ),
                                              Text(
                                                "${ref.watch(surahProvider).juzes[index].title}",
                                                style:
                                                    Style.interRegular(size: 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 14.verticalSpace;
                              },
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  ref.watch(surahProvider).bookmarks.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: ref
                                          .watch(surahProvider)
                                          .bookmarks[index]
                                          .verseIds
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int j) {
                                        return ButtonEffect(
                                          onTap: () {
                                            notifier
                                              ..selectBookmarkId(
                                                  ref
                                                      .watch(surahProvider)
                                                      .bookmarks[index]
                                                      .id,
                                                  ref
                                                      .watch(surahProvider)
                                                      .bookmarks[index]
                                                      .verseIds[j])
                                              ..fetchSurah(
                                                  context,
                                                  ref
                                                      .watch(surahProvider)
                                                      .bookmarks[index]
                                                      .id, onSuccess: () {
                                                scrollToIndex(2);
                                              });
                                          },
                                          child: Container(
                                            color: state.selectedBookmarkId ==
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .bookmarks[index]
                                                            .id &&
                                                    state.selectedVerseId ==
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .bookmarks[index]
                                                            .verseIds[j]
                                                ? Style.backgroundColor
                                                : null,
                                            height: 60.r,
                                            padding: REdgeInsets.all(5),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 50.r,
                                                  width: 50.r,
                                                  decoration: BoxDecoration(
                                                    color: Style.white,
                                                    border: Border.all(
                                                        color: Style.secondary,
                                                        width: 1.r),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.r),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "${ref.watch(surahProvider).bookmarks[index].id}",
                                                    style: Style.interRegular(
                                                        size: 10),
                                                  )),
                                                ),
                                                14.horizontalSpace,
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 50.r,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          ref
                                                              .watch(
                                                                  surahProvider)
                                                              .bookmarks[index]
                                                              .name,
                                                          style: Style
                                                              .interRegular(
                                                                  size: 18),
                                                        ),
                                                        Text(
                                                          "${ref.watch(surahProvider).bookmarks[index].verseIds[j]} - oyat",
                                                          style: Style
                                                              .interRegular(
                                                                  size: 8),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 14.verticalSpace;
                              },
                            ),
                ],
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
                : Column(
                    children: [
                      Container(
                        height: 40.r,
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
                                height: 32.r,
                                padding: REdgeInsets.symmetric(
                                    horizontal: 24, vertical: 5),
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
                                height: 32.r,
                                padding: REdgeInsets.symmetric(
                                    horizontal: 24, vertical: 5),
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
                                  }
                                },
                                child: Container(
                                  height: 32.r,
                                  padding: REdgeInsets.symmetric(
                                      horizontal: 24, vertical: 5),
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
                                            color:
                                                state.selectedIndicationType ==
                                                        2
                                                    ? Style.white
                                                    : Style.black),
                                      ),
                                      if (LocalStorage.getUserRate() != 2)
                                        10.horizontalSpace,
                                      if (LocalStorage.getUserRate() != 2)
                                        Icon(
                                          Icons.lock_outline_rounded,
                                          size: 24.r,
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (state.selectIndex == 0)
                        Column(
                          children: [
                            Text(
                              "${ref.watch(surahProvider).chapter?.name}",
                              style: Style.interSemi(size: 24),
                            ),
                            Text(
                              "${ref.watch(surahProvider).chapter?.typeChoice == 1 ? "Маккий" : "Маданий"}, ${ref.watch(surahProvider).chapter?.verseNumber} оят",
                              style: Style.interRegular(size: 16),
                            ),
                            120.verticalSpace,
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: ref
                                      .watch(surahProvider)
                                      .chapter
                                      ?.verses
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int j) {
                                return ButtonEffect(
                                  onTap: () {
                                    notifier.setBookMark(
                                        ref.watch(surahProvider).chapter?.id ??
                                            0,
                                        ref
                                                .watch(surahProvider)
                                                .chapter
                                                ?.verses?[j]
                                                .id ??
                                            0,
                                        ref
                                                .watch(surahProvider)
                                                .chapter
                                                ?.name ??
                                            "");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          BookmarkWidget(
                                            onTap: () {
                                              notifier.setBookMark(
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.id ??
                                                      0,
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.verses?[j]
                                                          .id ??
                                                      0,
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.name ??
                                                      "");
                                            },
                                            isBookmarked: state.bookmarks.any(
                                                (element) =>
                                                    element.id ==
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .chapter
                                                            ?.id &&
                                                    element.verseIds.contains(
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .chapter
                                                            ?.verses?[j]
                                                            .id)),
                                          ),
                                          const Spacer(),
                                          Container(
                                              height: 30.r,
                                              width: 30.r,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/png/juzComponent.png")),
                                              ),
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, -.3),
                                                child: Text(
                                                  "${ref.watch(surahProvider).chapter?.verses?[j].number}",
                                                  style: Style.interRegular(
                                                      size: 10),
                                                ),
                                              )),
                                          20.horizontalSpace,
                                          Flexible(
                                            child: Text(
                                              "${ref.watch(surahProvider).chapter?.verses?[j].textArabic}",
                                              style:
                                                  Style.interRegular(size: 20),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          20.horizontalSpace,
                                        ],
                                      ),
                                      if (state.selectedIndicationType == 1 ||
                                          state.selectedIndicationType == 2)
                                        28.verticalSpace,
                                      if (state.selectedIndicationType == 1 ||
                                          state.selectedIndicationType == 2)
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                "${ref.watch(surahProvider).chapter?.verses?[j].text}",
                                                style: Style.interRegular(
                                                    size: 20),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            20.horizontalSpace,
                                          ],
                                        ),
                                      if (state.selectedIndicationType == 2)
                                        28.verticalSpace,
                                      if (state.selectedIndicationType == 2)
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                "${ref.watch(surahProvider).chapter?.verses?[j].description}",
                                                style: Style.interRegular(
                                                    size: 20),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            20.horizontalSpace,
                                          ],
                                        ),
                                      14.verticalSpace
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                    padding:
                                        REdgeInsets.symmetric(vertical: 10),
                                    child: const Divider(
                                      thickness: 1,
                                      color: Style.secondary,
                                    ));
                              },
                            ),
                          ],
                        )
                      else if (state.selectIndex == 1)
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: ref
                                  .watch(surahProvider)
                                  .juz
                                  ?.result
                                  ?.chapters
                                  ?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${ref.watch(surahProvider).juz?.result?.chapters?[index].name}",
                                  style: Style.interSemi(size: 24),
                                ),
                                Text(
                                  "${ref.watch(surahProvider).juz?.result?.chapters?[index].typeChoice == 1 ? "Маккий" : "Маданий"}, "
                                  "${ref.watch(surahProvider).juz?.result?.chapters?[index].verseNumber} оят",
                                  style: Style.interRegular(size: 16),
                                ),
                                120.verticalSpace,
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: ref
                                          .watch(surahProvider)
                                          .juz
                                          ?.result
                                          ?.chapters?[index]
                                          .verses
                                          ?.length ??
                                      0,
                                  itemBuilder: (BuildContext context, int i) {
                                    return ButtonEffect(
                                      onTap: () {
                                        notifier.setBookMark(
                                            ref
                                                    .watch(surahProvider)
                                                    .juz
                                                    ?.result
                                                    ?.chapters?[index]
                                                    .id ??
                                                0,
                                            ref
                                                    .watch(surahProvider)
                                                    .juz
                                                    ?.result
                                                    ?.chapters?[index]
                                                    .verses?[i]
                                                    .id ??
                                                0,
                                            ref
                                                    .watch(surahProvider)
                                                    .juz
                                                    ?.result
                                                    ?.chapters?[index]
                                                    .name ??
                                                "");
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              BookmarkWidget(
                                                onTap: () {
                                                  notifier.setBookMark(
                                                      ref
                                                              .watch(
                                                                  surahProvider)
                                                              .juz
                                                              ?.result
                                                              ?.chapters?[index]
                                                              .id ??
                                                          0,
                                                      ref
                                                              .watch(
                                                                  surahProvider)
                                                              .juz
                                                              ?.result
                                                              ?.chapters?[index]
                                                              .verses?[i]
                                                              .id ??
                                                          0,
                                                      ref
                                                              .watch(
                                                                  surahProvider)
                                                              .juz
                                                              ?.result
                                                              ?.chapters?[index]
                                                              .name ??
                                                          "");
                                                },
                                                isBookmarked: state.bookmarks
                                                    .any((element) =>
                                                        element.id ==
                                                            ref
                                                                .watch(
                                                                    surahProvider)
                                                                .juz
                                                                ?.result
                                                                ?.chapters?[
                                                                    index]
                                                                .id &&
                                                        element.verseIds
                                                            .contains(ref
                                                                .watch(
                                                                    surahProvider)
                                                                .juz
                                                                ?.result
                                                                ?.chapters?[
                                                                    index]
                                                                .verses?[i]
                                                                .id)),
                                              ),
                                              const Spacer(),
                                              Container(
                                                  height: 30.r,
                                                  width: 30.r,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/png/juzComponent.png")),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const Alignment(0, -.3),
                                                    child: Text(
                                                      "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].number}",
                                                      style: Style.interRegular(
                                                          size: 10),
                                                    ),
                                                  )),
                                              20.horizontalSpace,
                                              Flexible(
                                                child: Text(
                                                  "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].textArabic}",
                                                  style: Style.interRegular(
                                                      size: 20),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                              20.horizontalSpace,
                                            ],
                                          ),
                                          if (state.selectedIndicationType ==
                                                  1 ||
                                              state.selectedIndicationType == 2)
                                            28.verticalSpace,
                                          if (state.selectedIndicationType ==
                                                  1 ||
                                              state.selectedIndicationType == 2)
                                            Row(
                                              children: [
                                                const Spacer(),
                                                Expanded(
                                                  child: Text(
                                                    "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].text}",
                                                    style: Style.interRegular(
                                                        size: 20),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                                20.horizontalSpace,
                                              ],
                                            ),
                                          if (state.selectedIndicationType == 2)
                                            28.verticalSpace,
                                          if (state.selectedIndicationType == 2)
                                            Row(
                                              children: [
                                                const Spacer(),
                                                Expanded(
                                                  child: Text(
                                                    "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].description}",
                                                    style: Style.interRegular(
                                                        size: 20),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                                20.horizontalSpace,
                                              ],
                                            ),
                                          14.verticalSpace
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                        padding:
                                            REdgeInsets.symmetric(vertical: 10),
                                        child: const Divider(
                                          thickness: 1,
                                          color: Style.secondary,
                                        ));
                                  },
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return 50.verticalSpace;
                          },
                        )
                      else
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${ref.watch(surahProvider).chapter?.name}",
                              style: Style.interSemi(size: 24),
                            ),
                            Text(
                              "${ref.watch(surahProvider).chapter?.typeChoice == 1 ? "Маккий" : "Маданий"}, ${ref.watch(surahProvider).chapter?.verseNumber} оят",
                              style: Style.interRegular(size: 16),
                            ),
                            120.verticalSpace,
                            ScrollablePositionedList.separated(
                              itemScrollController: _itemScrollController,
                              itemPositionsListener: _itemPositionsListener,
                              shrinkWrap: true,
                              itemCount: ref
                                      .watch(surahProvider)
                                      .chapter
                                      ?.verses
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int j) {
                                return ButtonEffect(
                                  onTap: () {
                                    notifier.setBookMark(
                                        ref.watch(surahProvider).chapter?.id ??
                                            0,
                                        ref
                                                .watch(surahProvider)
                                                .chapter
                                                ?.verses?[j]
                                                .id ??
                                            0,
                                        ref
                                                .watch(surahProvider)
                                                .chapter
                                                ?.name ??
                                            "");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          BookmarkWidget(
                                            onTap: () {
                                              notifier.setBookMark(
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.id ??
                                                      0,
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.verses?[j]
                                                          .id ??
                                                      0,
                                                  ref
                                                          .watch(surahProvider)
                                                          .chapter
                                                          ?.name ??
                                                      "");
                                            },
                                            isBookmarked: state.bookmarks.any(
                                                (element) =>
                                                    element.id ==
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .chapter
                                                            ?.id &&
                                                    element.verseIds.contains(
                                                        ref
                                                            .watch(
                                                                surahProvider)
                                                            .chapter
                                                            ?.verses?[j]
                                                            .id)),
                                          ),
                                          const Spacer(),
                                          Container(
                                              height: 30.r,
                                              width: 30.r,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/png/juzComponent.png")),
                                              ),
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, -.3),
                                                child: Text(
                                                  "${ref.watch(surahProvider).chapter?.verses?[j].number}",
                                                  style: Style.interRegular(
                                                      size: 10),
                                                ),
                                              )),
                                          20.horizontalSpace,
                                          Flexible(
                                            child: Text(
                                              "${ref.watch(surahProvider).chapter?.verses?[j].textArabic}",
                                              style:
                                                  Style.interRegular(size: 20),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          20.horizontalSpace,
                                        ],
                                      ),
                                      if (state.selectedIndicationType == 1 ||
                                          state.selectedIndicationType == 2)
                                        28.verticalSpace,
                                      if (state.selectedIndicationType == 1 ||
                                          state.selectedIndicationType == 2)
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                "${ref.watch(surahProvider).chapter?.verses?[j].text}",
                                                style: Style.interRegular(
                                                    size: 20),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            20.horizontalSpace,
                                          ],
                                        ),
                                      if (state.selectedIndicationType == 2)
                                        28.verticalSpace,
                                      if (state.selectedIndicationType == 2)
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                "${ref.watch(surahProvider).chapter?.verses?[j].description}",
                                                style: Style.interRegular(
                                                    size: 20),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            20.horizontalSpace,
                                          ],
                                        ),
                                      14.verticalSpace
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                    padding:
                                        REdgeInsets.symmetric(vertical: 10),
                                    child: const Divider(
                                      thickness: 1,
                                      color: Style.secondary,
                                    ));
                              },
                            ),
                          ],
                        )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
