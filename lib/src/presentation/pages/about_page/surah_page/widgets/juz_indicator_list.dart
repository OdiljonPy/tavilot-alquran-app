import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../components/components.dart';
import '../../../../styles/style.dart';

class JuzIndicatorList extends ConsumerWidget {
  const JuzIndicatorList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ref.watch(surahProvider).juz?.result?.chapters?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${ref.watch(surahProvider).juz?.result?.chapters?[index].name}",
              style: Style.interSemi(size: 24),
            ),
            Text(
              "${ref.watch(surahProvider).juz?.result?.chapters?[index].typeChoice == 1 ? LocaleKeys.makka.tr() : LocaleKeys.madina.tr()}, "
              "${ref.watch(surahProvider).juz?.result?.chapters?[index].verseNumber} ${LocaleKeys.verse.tr()}",
              style: Style.interRegular(size: 16),
            ),
            120.verticalSpace,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
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
                                    image: AssetImage(
                                        "assets/png/juzComponent.png")),
                              ),
                              child: Align(
                                alignment: const Alignment(0, -.3),
                                child: Text(
                                  "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].number}",
                                  style: Style.interRegular(size: 10),
                                ),
                              )),
                          20.horizontalSpace,
                          Flexible(
                            child: Text(
                              "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].textArabic}",
                              style: Style.regularArabic(size: 20),
                            ),
                          ),
                          20.horizontalSpace,
                        ],
                      ),
                      if ((state.selectedIndicationType == 1 ||
                              state.selectedIndicationType == 2) &&
                          (ref
                                  .watch(surahProvider)
                                  .juz
                                  ?.result
                                  ?.chapters?[index]
                                  .verses?[i]
                                  .text
                                  ?.isNotEmpty ??
                              false))
                        28.verticalSpace,
                      if ((state.selectedIndicationType == 1 ||
                              state.selectedIndicationType == 2) &&
                          (ref
                                  .watch(surahProvider)
                                  .juz
                                  ?.result
                                  ?.chapters?[index]
                                  .verses?[i]
                                  .text
                                  ?.isNotEmpty ??
                              false))
                        Row(
                          children: [
                            20.horizontalSpace,
                            Expanded(
                              child: Text(
                                "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].text}",
                                style: Style.interRegular(size: 20),
                              ),
                            ),
                            20.horizontalSpace,
                          ],
                        ),
                      if (state.selectedIndicationType == 2 &&
                          (ref
                                  .watch(surahProvider)
                                  .juz
                                  ?.result
                                  ?.chapters?[index]
                                  .verses?[i]
                                  .description
                                  ?.isNotEmpty ??
                              false))
                        28.verticalSpace,
                      if (state.selectedIndicationType == 2 &&
                          (ref
                                  .watch(surahProvider)
                                  .juz
                                  ?.result
                                  ?.chapters?[index]
                                  .verses?[i]
                                  .description
                                  ?.isNotEmpty ??
                              false))
                        Row(
                          children: [
                            20.horizontalSpace,
                            Expanded(
                              child: Text(
                                "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].description}",
                                style: Style.interRegular(size: 20),
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
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: REdgeInsets.symmetric(vertical: 10),
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
    );
  }
}
