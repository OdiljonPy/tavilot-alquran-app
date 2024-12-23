import 'dart:convert';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../components/components.dart';
import '../../../../styles/style.dart';

class ChapterIndicatorList extends ConsumerWidget {
  const ChapterIndicatorList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return Column(
      children: [
        Text(
          "${ref.watch(surahProvider).chapter?.name}",
          style: Style.interSemi(size: 24),
        ),
        Text(
          "${ref.watch(surahProvider).chapter?.typeChoice == 1 ? LocaleKeys.makka.tr() : LocaleKeys.madina.tr()}, "
          "${ref.watch(surahProvider).chapter?.verseNumber} "
          "${LocaleKeys.verse.tr()}",
          style: Style.interRegular(size: 16),
        ),
        120.verticalSpace,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ref.watch(surahProvider).chapter?.verses?.length ?? 0,
          itemBuilder: (BuildContext context, int j) {
            return ButtonEffect(
              onTap: () {
                notifier.setBookMark(
                    ref.watch(surahProvider).chapter?.id ?? 0,
                    ref.watch(surahProvider).chapter?.verses?[j].id ?? 0,
                    ref.watch(surahProvider).chapter?.name ?? "");
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
                                image:
                                    AssetImage("assets/png/juzComponent.png")),
                          ),
                          child: Align(
                            alignment: const Alignment(0, -.3),
                            child: Text(
                              "${ref.watch(surahProvider).chapter?.verses?[j].number}",
                              style: Style.interRegular(size: 10),
                            ),
                          )),
                      20.horizontalSpace,
                      Flexible(
                          child: Text(
                        "${ref.watch(surahProvider).chapter?.verses?[j].textArabic}",
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
                            "${ref.watch(surahProvider).chapter?.verses?[j].text}",
                            style: Style.interRegular(size: 20),
                            // textAlign: TextAlign.end,
                          ),
                        ),
                        20.horizontalSpace,
                      ],
                    ),
                  if (state.selectedIndicationType == 2 &&
            (ref
                          .watch(surahProvider)
                          .chapter
                          ?.verses?[j]
                          .description
                          ?.isNotEmpty ?? false ))
                    28.verticalSpace,
                  if (state.selectedIndicationType == 2 &&
            (ref
                .watch(surahProvider)
                .chapter
                ?.verses?[j]
                .description
                ?.isNotEmpty ?? false ))
                  Markdown(
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
                          // Handle decoding errors
                          return const Icon(Icons.error, color: Colors.red);
                        }
                      },
                      styleSheet: MarkdownStyleSheet(
                        p: Style.interRegular(size: 20),
                        blockquotePadding: const EdgeInsets.all(12.0),
                        textAlign: WrapAlignment.center,
                      ),
                      data:
                      ref.watch(surahProvider).chapter?.verses?[j].description ??
                          ""),
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
        ),
      ],
    );
  }
}
