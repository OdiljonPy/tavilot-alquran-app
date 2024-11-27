import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../components/components.dart';
import '../../../../styles/style.dart';

class BookmarkList extends ConsumerWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return ListView.separated(
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
                        // scrollToIndex(2);
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
                                  "${ref.watch(surahProvider).bookmarks[index].verseIds[j]} - ${LocaleKeys.verse.tr()}",
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
    );
  }
}


