import 'dart:async';
import 'package:al_quran/application/about/about_provider.dart';
import 'package:al_quran/application/surah/surah_provider.dart';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/presentation/pages/about_page/surah_page/surah_page.dart';
import 'package:al_quran/src/presentation/pages/for_students/for_students_page.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/state/main_state.dart';
import 'package:al_quran/src/presentation/pages/main/widgets/custom_pop_up.dart';
import 'package:al_quran/src/presentation/pages/main/widgets/logout_modal.dart';
import 'package:al_quran/src/presentation/pages/premium/premium_page.dart';
import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/app_helpers.dart';
import '../../components/app_logo.dart';
import '../../components/components.dart';
import '../../styles/style.dart';
import '../about_page/about_page.dart';
import '../about_page/blog_page/blog_page.dart';
import 'riverpod/notifier/main_notifier.dart';
import 'riverpod/provider/main_provider.dart';

BuildContext? c;

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        openAppLink(uri);
      });
    });
  }

  void openAppLink(Uri uri) {
    context.pushRoute(const SuccessRoute());
  }

  @override
  void initState() {
    super.initState();
    initDeepLinks();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(surahProvider.notifier).setBookmarkFromLocale();
      ref.read(mainProvider.notifier)
        ..setPageController()
        ..fetchChapters(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    c = context;
    return SafeArea(
      child: KeyboardDismisser(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(mainProvider);
            final notifier = ref.read(mainProvider.notifier);
            return Scaffold(
              appBar: customAppBar(notifier, state),
              body: PageView(
                controller: state.pageController,
                onPageChanged: notifier.changeIndex,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  BlogPage(),
                  ForStudentsPage(),
                  AboutPage(),
                  SurahPage(),
                  PremiumPage(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar customAppBar(MainNotifier notifier, MainState state) {
    return AppBar(
      backgroundColor: Style.bg,
      automaticallyImplyLeading: false,
      elevation: 0.5,
      title: IntrinsicHeight(
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  ref.read(mainProvider.notifier)
                    ..fetchChapters(context)
                    ..changeIndex(0);
                },
                child: const AppLogo()),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  12.horizontalSpace,
                  CatalogTextItem(
                      title: LocaleKeys.abuMansurMotrudiy.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(1);
                        ref.read(forStudentsProvider.notifier)
                          ..selectCategory(0)
                          ..fetchCategory(context, index: 0);
                      },
                      isActive: state.selectIndex == 1 && ref.watch(forStudentsProvider).selectedCategory ==0),
                  CatalogTextItem(
                      title: LocaleKeys.tavilotAlQuran.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(3,
                            onSuccess: () async {
                              ref.read(surahProvider.notifier)
                                ..selectSurahId(1)
                                ..fetchJuzes(context)
                                ..fetchSurah(context, 1)
                                ..fetchJuz(context, 1);
                            });
                      },
                      isActive: state.selectIndex == 3),
                  CatalogTextItem(
                      title: LocaleKeys.manuscriptAndComments.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(1);
                        ref.read(forStudentsProvider.notifier)
                          ..selectCategory(1)
                          ..fetchCategory(context, index: 1);
                      },
                      isActive: state.selectIndex == 1 && ref.watch(forStudentsProvider).selectedCategory ==1),
                  CatalogTextItem(
                      title: LocaleKeys.modernStudies.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(1);
                        ref.read(forStudentsProvider.notifier)
                          ..selectCategory(2)
                          ..fetchCategory(context, index: 2);
                      },
                      isActive: state.selectIndex == 1 && ref.watch(forStudentsProvider).selectedCategory ==2),
                  CatalogTextItem(
                      title: LocaleKeys.resources.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(1);
                        ref.read(forStudentsProvider.notifier)
                          ..selectCategory(3)
                          ..fetchCategory(context, index: 3);
                      },
                      isActive: state.selectIndex == 1 && ref.watch(forStudentsProvider).selectedCategory ==3),
                  CatalogTextItem(
                      title: LocaleKeys.rebuttalsToFanaticism.tr(),
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(1);
                        ref.read(forStudentsProvider.notifier)
                          ..selectCategory(4)
                          ..fetchCategory(context, index: 4);
                      },
                      isActive: state.selectIndex == 1 && ref.watch(forStudentsProvider).selectedCategory ==4),
                  Row(
                    children: [
                      const CustomPopupItem(),
                      12.horizontalSpace,
                      ButtonEffect(
                        onTap: () {
                          AppHelpers.showAlertDialog(
                            context: context,
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height / 4,
                              width: MediaQuery.sizeOf(context).width / 5,
                              child: const LogOutModal(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.bg,
                          ),
                          child: const Icon(
                            FlutterRemix.logout_circle_r_line,
                            color: Style.primary,
                            size: 24,
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      ButtonEffect(
                        onTap: () {
                          ref.read(aboutProvider.notifier).fetchAbout(context);
                          ref.read(mainProvider.notifier).changeIndex(2);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.bg,
                          ),
                          child: const Icon(
                            FlutterRemix.information_line,
                            color: Style.primary,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatalogTextItem extends ConsumerWidget {
  const CatalogTextItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  final String title;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context, ref) {
    return ButtonEffect(
      onTap:(){
        onTap();
        if(ref.watch(forStudentsProvider).selectedIndex == 1){
          ref.read(forStudentsProvider.notifier).changeIndex(0, context);
        }
      } ,
      child: Text(
        title,
        style: Style.interRegular(
            textDecoration:
                isActive ? TextDecoration.underline : TextDecoration.none,
            size: 14,
            color: isActive ? Style.darkGreen : Style.black),
      ),
    );
  }
}
