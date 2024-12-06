import 'dart:async';
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
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../application/about/about_provider.dart';
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
      ref.read(surahProvider.notifier)
          .setBookmarkFromLocale();
      ref.read(mainProvider.notifier)
          ..setPageController()
          ..fetchChapters(context);
      ref.read(forStudentsProvider.notifier)
          .fetchCategories(context);
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
                children: const [
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
             const Expanded(
              flex: 2,
              child:
               SizedBox.shrink()
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    ButtonEffect(
                      onTap: () {
                        ref
                            .read(mainProvider.notifier)
                            .changeIndex(0, onSuccess: () {});
                      },
                      child: Text(
                        LocaleKeys.mainPage.tr(),
                        style: Style.interRegular(
                            textDecoration: state.selectIndex == 0
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            size: 14,
                            color: state.selectIndex == 0
                                ? Style.darkGreen
                                : Style.black),
                      ),
                    ),
                    36.horizontalSpace,
                    ButtonEffect(
                      onTap: () {
                        ref
                            .read(mainProvider.notifier)
                            .changeIndex(1, onSuccess: () {
                              ref.read(forStudentsProvider.notifier).fetchCategories(context);
                        });
                      },
                      child: Text(
                        LocaleKeys.forStudent.tr(),
                        style: Style.interRegular(
                            textDecoration: state.selectIndex == 1
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            size: 14,
                            color: state.selectIndex == 1
                                ? Style.darkGreen
                                : Style.black),
                      ),
                    ),
                    36.horizontalSpace,
                    ButtonEffect(
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(2,
                            onSuccess: () {
                          ref.read(aboutProvider.notifier).fetchAbout(context);
                        });
                      },
                      child: Text(
                        LocaleKeys.aboutApp.tr(),
                        style: Style.interRegular(
                            textDecoration: state.selectIndex == 2
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            size: 14,
                            color: state.selectIndex == 2
                                ? Style.darkGreen
                                : Style.black),
                      ),
                    ),
                    const Spacer(),
                    const CustomPopupItem(),
                    12.horizontalSpace,
                    ButtonEffect(
                      onTap: () {
                        notifier.changeIndex(3);
                        ref.read(surahProvider.notifier).changeIndex(2);
                        if (ref.watch(surahProvider).selectedBookmarkId == 0 &&
                            ref.watch(surahProvider).bookmarks.isNotEmpty) {
                          ref.read(surahProvider.notifier)
                            ..fetchSurah(context,
                                ref.watch(surahProvider).bookmarks.first.id)
                            ..selectBookmarkId(
                                ref.watch(surahProvider).bookmarks.first.id,
                                ref
                                    .watch(surahProvider)
                                    .bookmarks
                                    .first
                                    .verseIds
                                    .first);
                        }
                        ref.read(surahProvider.notifier)
                          ..fetchJuzes(context)
                          ..fetchJuz(context, 1);
                      },
                      child: SvgPicture.asset(
                        "assets/svg/bookmark.svg",
                      ),
                    ),
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
