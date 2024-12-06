import 'package:al_quran/application/for_students/for_students_provider.dart';
import 'package:al_quran/application/surah/surah_provider.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../application/about/about_provider.dart';
import '../../../../../generated/assets.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../styles/style.dart';

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({super.key});

  @override
  ConsumerState<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends ConsumerState<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.r,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/png/mainSearchBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: OutlinedBorderTextField(
                        onChanged: ref.read(mainProvider.notifier).changeQuery,
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Style.textHint,
                        ),
                        label: null,
                        hintText: LocaleKeys.whatUWant.tr(),
                        color: Style.white,
                        radius: 40,
                      )),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              )),
          60.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                    child: ButtonEffect(
                  onTap: () {
                    ref.read(mainProvider.notifier).changeIndex(1);
                    ref
                        .read(forStudentsProvider.notifier)
                        .fetchCategories(context);
                  },
                  child: Container(
                    padding: REdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Style.secondary,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    height: 180.r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/svg/book.svg",
                            height: 30, width: 30, color: Style.black),
                        const Spacer(),
                        Text(
                          LocaleKeys.forStudent.tr(),
                          style:
                              Style.interRegular(size: 24, color: Style.black),
                        )
                      ],
                    ),
                  ),
                )),
                12.horizontalSpace,
                Expanded(
                    child: ButtonEffect(
                  onTap: () {
                    ref.read(mainProvider.notifier).changeIndex(4);
                  },
                  child: Container(
                    padding: REdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Style.secondary,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    height: 180.r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/svg/bag.svg",
                            height: 30, width: 30, color: Style.black),
                        const Spacer(),
                        Text(
                          LocaleKeys.sells.tr(),
                          style:
                              Style.interRegular(size: 24, color: Style.black),
                        )
                      ],
                    ),
                  ),
                )),
                12.horizontalSpace,
                Expanded(
                    child: ButtonEffect(
                  onTap: () {
                    ref.read(mainProvider.notifier).changeIndex(2);
                    ref.read(aboutProvider.notifier).fetchAbout(context);
                  },
                  child: Container(
                    padding: REdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Style.secondary,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    height: 180.r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/info.svg",
                          height: 30,
                          width: 30,
                        ),
                        const Spacer(),
                        Text(
                          LocaleKeys.aboutApp.tr(),
                          style:
                              Style.interRegular(size: 24, color: Style.black),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          60.verticalSpace,
          ButtonEffect(
            onTap: () {
              // LocalStorage.setToken("dsfdasfdsaf");
              // context.pushRoute(const SuccessRoute());
              // ref.read(mainProvider.notifier).changeIndex(4);
              // LocalStorage.deleteToken();
            },
            child: Padding(
                padding: REdgeInsets.only(left: 40, bottom: 30),
                child: Text(
                  LocaleKeys.chapters.tr(),
                  style: Style.interNormal(size: 36, color: Style.black),
                )),
          ),
          ref.watch(mainProvider).chapters.isEmpty
              ? const Loading()
              : ref.watch(mainProvider).isChapterSearching &&
                      ref.watch(mainProvider).searchChapters.isNotEmpty
                  ? GridView.builder(
                      padding: REdgeInsets.all(40),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 12.r,
                          crossAxisSpacing: 12.r,
                          crossAxisCount: 3,
                          mainAxisExtent: 110.r),
                      itemCount: ref.read(mainProvider).searchChapters.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ButtonEffect(
                          onTap: () {
                            ref.read(mainProvider.notifier).changeIndex(3,
                                onSuccess: () async {
                              ref.read(surahProvider.notifier)
                                ..selectSurahId(ref
                                        .watch(mainProvider)
                                        .searchChapters[index]
                                        .id ??
                                    0)
                                ..fetchJuzes(context)
                                ..fetchSurah(
                                    context,
                                    ref
                                            .watch(mainProvider)
                                            .searchChapters[index]
                                            .id ??
                                        0)
                                ..fetchJuz(context, 1);
                            });
                          },
                          child: Container(
                            padding: REdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Style.borderColor, width: 1),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 60.r,
                                  width: 60.r,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        Assets.star,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(mainProvider).searchChapters[index].number ?? ref.watch(mainProvider).searchChapters[index].id ?? 0}",
                                      style: Style.interRegular(
                                        size: 24,
                                        color: Style.white,
                                      ),
                                    ),
                                  ),
                                ),
                                20.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${ref.watch(mainProvider).searchChapters[index].name}",
                                      style: Style.interRegular(
                                          size: 24, color: Style.black),
                                    ),
                                    Text(
                                      "${ref.watch(mainProvider).searchChapters[index].typeChoice == 1 ? LocaleKeys.makka.tr() : LocaleKeys.madina.tr()}, ${ref.watch(mainProvider).searchChapters[index].verseNumber} ${LocaleKeys.verse.tr()}",
                                      style: Style.interRegular(
                                          size: 10, color: Style.black),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${ref.read(mainProvider).searchChapters[index].nameArabic}",
                                        style: Style.interRegular(
                                            size: 20, color: Style.black)),
                                    Text(
                                      "${ref.watch(mainProvider).searchChapters[index].verseNumber} ${LocaleKeys.verse.tr()}",
                                      style: Style.interRegular(
                                          size: 16, color: Style.textHint),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : ref.watch(mainProvider).isChapterSearching &&
                          ref.watch(mainProvider).searchChapters.isEmpty
                      ? const Text("")
                      : GridView.builder(
                          padding: REdgeInsets.all(40),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 12.r,
                                  crossAxisSpacing: 12.r,
                                  crossAxisCount: 3,
                                  mainAxisExtent: 120.r),
                          itemCount: ref.read(mainProvider).chapters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ButtonEffect(
                              onTap: () {
                                ref.read(mainProvider.notifier).changeIndex(3,
                                    onSuccess: () async {
                                  ref.read(surahProvider.notifier)
                                    ..selectSurahId(ref
                                            .watch(mainProvider)
                                            .chapters[index]
                                            .id ??
                                        0)
                                    ..fetchJuzes(context)
                                    ..fetchSurah(context, index + 1)
                                    ..fetchJuz(context, index + 1);
                                });
                              },
                              child: Container(
                                padding: REdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Style.borderColor, width: 1),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60.r,
                                      width: 60.r,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.star,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: Style.interRegular(
                                            size: 24,
                                            color: Style.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    20.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${ref.watch(mainProvider).chapters[index].name}",
                                          style: Style.interRegular(
                                              size: 24, color: Style.black),
                                        ),
                                        Text(
                                          "${ref.watch(mainProvider).chapters[index].typeChoice == 1 ? LocaleKeys.makka.tr() : LocaleKeys.madina.tr()}, ${ref.watch(mainProvider).chapters[index].verseNumber} ${LocaleKeys.verse.tr()}",
                                          style: Style.interRegular(
                                              size: 10, color: Style.black),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${ref.read(mainProvider).chapters[index].nameArabic}",
                                            style: Style.regularArabic(
                                                size: 20, color: Style.black)),
                                        Text(
                                          "${ref.watch(mainProvider).chapters[index].verseNumber} ${LocaleKeys.verse.tr()}",
                                          style: Style.interRegular(
                                              size: 16, color: Style.textHint),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
        ],
      ),
    );
  }
}
