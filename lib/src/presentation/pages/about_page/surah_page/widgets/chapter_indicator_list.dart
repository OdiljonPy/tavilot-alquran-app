import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../components/flutter_markdown/flutter_markdown.dart';
import '../../../../styles/style.dart';

class ChapterIndicatorList extends ConsumerStatefulWidget {
  const   ChapterIndicatorList({super.key});

  @override
  ConsumerState<ChapterIndicatorList> createState() => _ChapterIndicatorListState();
}

class _ChapterIndicatorListState extends ConsumerState<ChapterIndicatorList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
    
    // controller = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    //     axis: Axis.vertical);
  }
  // Future _scrollToCounter(int index) async {
  //   await controller.scrollToIndex(index,
  //       preferPosition: AutoScrollPosition.begin);
  //   controller.highlight(index);
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(surahProvider);
    return ListView.separated(
      shrinkWrap: true,
      controller: state.autoScrollController,
      itemCount: state.chapter?.verses?.length ?? 0,
      itemBuilder: (BuildContext context, int j) {
        return AutoScrollTag(
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
                  state.chapter?.verses?[j].description ??
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
    );
  }
}
