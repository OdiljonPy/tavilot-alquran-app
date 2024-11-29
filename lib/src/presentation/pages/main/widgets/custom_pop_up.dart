import 'package:al_quran/application/about/about_provider.dart';
import 'package:al_quran/application/for_students/for_students_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../application/surah/surah_provider.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../styles/style.dart';
import '../riverpod/provider/main_provider.dart';

class CustomPopupItem extends ConsumerWidget {
  const CustomPopupItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.read(mainProvider.notifier);
    return PopupMenuButton(
      splashRadius: 20.r,
      constraints: BoxConstraints(
        maxWidth: 120.r,
      ),
      tooltip: LocaleKeys.chooseLang.tr(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 1,
      padding: EdgeInsets.zero,
      icon: SizedBox(
        width: 42.r,
        height: 42.r,
        child: Center(
            child: SvgPicture.asset("assets/svg/lang.svg")),
      ),
      itemBuilder: (c) {
        return [
            _buildPopupMenuItem(
              context: context,
              title: LocaleKeys.lotin.tr(),
              onTap: () {
                Navigator.pop(c);
                context.setLocale(const Locale('uz', 'UZ')).then((_) {
                  notifier.changeIndex(ref.watch(mainProvider).selectIndex);
                  notifier.fetchChapters(context, lang: "uz");
                  if(ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 1){
                    ref.read(surahProvider.notifier).fetchJuzes(context,lang: "uz");
                    ref.read(surahProvider.notifier).fetchJuz(context, ref.watch(surahProvider).selectedJuzId,lang: "uz");
                  }else if((ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 0)
                      || (ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 2)){
                    ref.read(surahProvider.notifier).fetchSurah(context, ref.watch(surahProvider).selectedSurahId, lang: "uz");
                  }else if(ref.watch(mainProvider).selectIndex ==2){
                    ref.read(aboutProvider.notifier).fetchAbout(context, lang: "uz");
                  }else if(ref.watch(mainProvider).selectIndex ==1){
                    ref.read(forStudentsProvider.notifier).fetchCategories(context, lang: "uz");
                  }
                });
              },
            ),
            _buildPopupMenuItem(
              context: context,
              title: LocaleKeys.kiril.tr(),
              onTap: () {
                Navigator.pop(c);
                context.setLocale(const Locale('ru', 'RU')).then((_) {
                  notifier.changeIndex(ref.watch(mainProvider).selectIndex);
                  notifier.fetchChapters(context, lang: "kr");
                  if(ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 1){
                    ref.read(surahProvider.notifier).fetchJuzes(context,lang: "kr");
                    ref.read(surahProvider.notifier).fetchJuz(context, ref.watch(surahProvider).selectedJuzId,lang: "kr");
                  }else if((ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 0)
                      || (ref.watch(mainProvider).selectIndex == 3 && ref.watch(surahProvider).selectIndex == 2)){
                    ref.read(surahProvider.notifier).fetchSurah(context, ref.watch(surahProvider).selectedSurahId, lang: "kr");
                  }else if(ref.watch(mainProvider).selectIndex ==2){
                    ref.read(aboutProvider.notifier).fetchAbout(context, lang: "kr");
                  }else if(ref.watch(mainProvider).selectIndex ==1){
                    ref.read(forStudentsProvider.notifier).fetchCategories(context, lang: "kr");
                  }
                });
              },
            ),
        ];
      },
    );
  }

  PopupMenuItem _buildPopupMenuItem({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:REdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
              width: 0.3.r,
            ),
          ),
          child: Text(
            title,
            style: Style.interNormal(
                size: 12,
                color: textColor ?? Style.black),
          ),
        ),
      ),
    );
  }
}
