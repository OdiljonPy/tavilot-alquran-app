import 'package:al_quran/src/models/response/juz_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../styles/style.dart';
import '../../../main/riverpod/provider/main_provider.dart';

class ChapterList extends ConsumerWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: ref.watch(mainProvider).chapters.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChapterWidget(index: index, chapter: ref.watch(mainProvider).chapters[index],);
      },
      separatorBuilder: (BuildContext context, int index) {
        return 14.verticalSpace;
      },
    );
  }
}

class SingleChapterWidget extends ConsumerWidget {
  const SingleChapterWidget({
    super.key,
    required this.index,
    required this.chapter,
  });

  final int index;
  final Chapter chapter;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return InkWell(
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
        width: double.infinity,
        padding: REdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              height: 50.r,
              width: 50.r,
              decoration: BoxDecoration(
                color: Style.white,
                border: Border.all(color: Style.secondary, width: 1.r),
                borderRadius: BorderRadius.circular(30.r),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${ref.watch(mainProvider).chapters[index].name}",
                          style: Style.interRegular(size: 18),
                        ),
                        Text(
                          "${ref.watch(mainProvider).chapters[index].verseNumber == 0 ? LocaleKeys.makka.tr() : LocaleKeys.madina.tr()}, ${ref.watch(mainProvider).chapters[index].verseNumber} оят",
                          style: Style.interRegular(size: 8),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "${ref.watch(mainProvider).chapters[index].nameArabic}",
                      style: Style.regularArabic(size: 20),
                    ),
                    5.horizontalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
