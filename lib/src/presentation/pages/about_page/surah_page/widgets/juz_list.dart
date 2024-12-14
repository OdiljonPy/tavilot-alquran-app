import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../application/surah/surah_provider.dart';
import '../../../../styles/style.dart';

class JuzList extends ConsumerWidget {
  const JuzList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(surahProvider);
    final notifier = ref.read(surahProvider.notifier);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: ref.watch(surahProvider).juzes.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                if(state.isDrawerOpened)
                14.horizontalSpace,
                if(state.isDrawerOpened)
                Expanded(
                  child: SizedBox(
                    height: 50.r,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${ref.watch(surahProvider).juzes[index].number} - ${LocaleKeys.juz.tr()}",
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
    );
  }
}


