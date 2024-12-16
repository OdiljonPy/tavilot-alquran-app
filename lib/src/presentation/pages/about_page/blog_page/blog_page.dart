import 'package:al_quran/application/for_students/for_students_provider.dart';
import 'package:al_quran/application/surah/surah_provider.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import 'widgets/main_post_item.dart';

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({super.key});

  @override
  ConsumerState<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends ConsumerState<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width,
            height: 220.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/mainSearchBackground.png"),
                fit: BoxFit.cover,

              ),
            ),
          child: Image.asset("assets/png/blog_logo.png"),
        ),
        60.verticalSpace,
        GridView(
          padding: REdgeInsets.symmetric(horizontal: 20,),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20.r,
            crossAxisSpacing: 20.r,
            crossAxisCount: 3,
            mainAxisExtent: 250.r,
          ),
          children: [
            MainPostItem(
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(1);
                ref.read(forStudentsProvider.notifier)
                  ..selectCategory(0)
                    ..fetchCategory(context, index: 0);
              },
              icon: "assets/svg/book.svg",
              title: LocaleKeys.abuMansurMotrudiy.tr(),
              index: 1,
            ),
            MainPostItem(
              index: 2,
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(3,
                    onSuccess: () async {
                      ref.read(surahProvider.notifier)
                        ..selectSurahId(1)
                        ..fetchJuzes(context)
                        ..fetchSurah(context, 1)
                        ..fetchJuz(context, 1);
                    });
              },              icon: "assets/svg/book.svg",
              title: LocaleKeys.tavilotAlQuran.tr(),
            ),
            MainPostItem(
              index: 3,
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(1);
                ref.read(forStudentsProvider.notifier)
                  ..selectCategory(1)
                    ..fetchCategory(context, index: 1);
              },
              icon: "assets/svg/book.svg",
              title: LocaleKeys.manuscriptAndComments.tr(),
            ),
            MainPostItem(
              index: 4,
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(1);
                ref.read(forStudentsProvider.notifier)
                    ..selectCategory(2)
                    ..fetchCategory(context, index: 2);
              },
              icon: "assets/svg/book.svg",
              title: LocaleKeys.modernStudies.tr(),
            ),
            MainPostItem(
              index: 5,
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(1);
                ref.read(forStudentsProvider.notifier)
                  ..selectCategory(3)
                    ..fetchCategory(context, index: 3);
              },
              icon: "assets/svg/book.svg",
              title: LocaleKeys.resourcesStudyGuides.tr(),
            ),
            MainPostItem(
              index: 6,
              onTap: () {
                ref.read(mainProvider.notifier).changeIndex(1);
                ref.read(forStudentsProvider.notifier)
                  ..selectCategory(4)
                    ..fetchCategory(context, index: 4);
              },
              icon: "assets/svg/book.svg",
              title: LocaleKeys.rebuttalsToFanaticism.tr(),
            ),
          ],
        ),
      ],
    );
  }
}

