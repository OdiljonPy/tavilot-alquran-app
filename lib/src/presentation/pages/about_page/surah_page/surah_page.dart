import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../styles/style.dart';

class SurahPage extends ConsumerWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: ColoredBox(
                color: Style.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: ref.watch(surahProvider).juzes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 60.r,
                            // decoration: BoxDecoration(
                            //   color: Style.bg,
                            // ),
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
                    ),
                    Container(width: 2,height: 1, color: Colors.red,)
                  ],
                ),
              )),
          Expanded(
            flex: 11,
            child: ref.watch(surahProvider).isJuzLoading ? const Loading(): ListView.separated(
                              shrinkWrap: true,
                              itemCount:
              ref.watch(surahProvider).juz?.result?.chapters?.length ??0,
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
                      ?.length  ?? 0,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                          Container(
                            height: 30.r,
                            width: 30.r,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/png/juzComponent.png")),
                            ),
                            child: Align(
                              alignment: const Alignment(0, -.3),
                              child: Text(
                                "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].number}",
                                style: Style.interRegular(size: 10),
                              ),
                            )
                          ),
                            20.horizontalSpace,
                            Flexible(
                              child: Text(
                                "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].textArabic}",
                                style: Style.interRegular(size: 20),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            20.horizontalSpace,
                        ],),
                        28.verticalSpace,
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Text(
                                "${ref.watch(surahProvider).juz?.result?.chapters?[index].verses?[i].text}",
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
                  }, separatorBuilder: (BuildContext context, int index) {
                    return  Padding(
                        padding: REdgeInsets.symmetric(vertical: 10),
                        child: const Divider( thickness: 1, color: Style.secondary,));
                },
                )
              ],
            );
                              }, separatorBuilder: (BuildContext context, int index) { return 50.verticalSpace;},
                            ),
          ),
        ],
      ),
    );
  }
}
