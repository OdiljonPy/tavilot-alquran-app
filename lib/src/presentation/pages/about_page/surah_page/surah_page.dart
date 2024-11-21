import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../styles/style.dart';

class SurahPage extends ConsumerWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: ColoredBox(
                color: Style.white,
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
                          child: Text("Suralar",
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
                          child: Text("Juzlar",
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
                          child: Text("Hatcho`plar",
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
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: ref.watch(surahProvider).juzes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                  borderRadius: BorderRadius.circular(30.r),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${ref.watch(surahProvider).juzes[index].number} - жуз",
                                      style: Style.interRegular(size: 18),
                                    ),
                                    Text(
                                      "${ref.watch(surahProvider).juzes[index].title}",
                                      style: Style.interRegular(size: 8),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 14.verticalSpace;
                      },
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 11,
            child: ref.watch(surahProvider).isJuzLoading
                ? const Center(child: Loading())
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
                                  "Arabcha",
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
                                  "Tarjima",
                                  style: Style.interRegular(
                                      size: 16,
                                      color: state.selectedIndicationType == 1
                                          ? Style.white
                                          : Style.black),
                                ),
                              ),
                            ),
                            ButtonEffect(
                              onTap: () {
                                notifier.changeIndicationType(2);
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
                                child: Text(
                                  "Ta`fsir",
                                  style: Style.interRegular(
                                      size: 16,
                                      color: state.selectedIndicationType == 2
                                          ? Style.white
                                          : Style.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      state.selectIndex == 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemCount: ref
                                      .watch(surahProvider)
                                      .chapter
                                      ?.verses
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int j) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
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
                                            style: Style.interRegular(size: 20),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        20.horizontalSpace,
                                      ],
                                    ),
                                    28.verticalSpace,
                                    Row(
                                      children: [
                                        const Spacer(),
                                        Expanded(
                                          child: Text(
                                            "${ref.watch(surahProvider).chapter?.verses?[j].text}",
                                            style: Style.interRegular(size: 20),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        20.horizontalSpace,
                                      ],
                                    ),
                                    14.verticalSpace
                                  ],
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
                          : ListView.separated(
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
                                      "${ref.watch(surahProvider).juz?.result?.chapters?[index].typeChoice == 1 ? "Маккий" : "Маданий"}, ${ref.watch(surahProvider).juz?.result?.chapters?[index].verseNumber} оят",
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
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Column(
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
                                                          const Alignment(
                                                              0, -.3),
                                                      child: Text(
                                                        "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].number}",
                                                        style:
                                                            Style.interRegular(
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
                                            28.verticalSpace,
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
                                            14.verticalSpace
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: REdgeInsets.symmetric(
                                                vertical: 10),
                                            child: const Divider(
                                              thickness: 1,
                                              color: Style.secondary,
                                            ));
                                      },
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return 50.verticalSpace;
                              },
                            ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
