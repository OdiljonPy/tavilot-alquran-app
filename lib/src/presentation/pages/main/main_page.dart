import 'package:al_quran/application/surah/surah_provider.dart';
import 'package:al_quran/src/presentation/pages/about_page/surah_page/surah_page.dart';
import 'package:al_quran/src/presentation/pages/for_students/for_students_page.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/state/main_state.dart';
import 'package:al_quran/src/presentation/pages/premium/premium_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import '../../../../application/about/about_provider.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../components/app_logo.dart';
import '../../components/components.dart';
import '../../styles/style.dart';
import '../about_page/about_page.dart';
import '../about_page/blog_page/blog_page.dart';
import 'riverpod/notifier/main_notifier.dart';
import 'riverpod/provider/main_provider.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  late List<IndexedStackChild> list = [
    IndexedStackChild(child: const BlogPage(), preload: true),
    IndexedStackChild(child: const ForStudentsPage()),
    IndexedStackChild(child: const AboutPage()),
    IndexedStackChild(child: const SurahPage()),
    IndexedStackChild(child: const PremiumPage()),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(surahProvider.notifier).setBookmarkFromLocale();
      ref.read(mainProvider.notifier)
        ..changeIndex(0)
        ..fetchChapters(context);
      ref.read(forStudentsProvider.notifier).fetchCategories(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismisser(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(mainProvider);
            final notifier = ref.read(mainProvider.notifier);
            return Scaffold(
              appBar: customAppBar(notifier, state),
              body:
                  ProsteIndexedStack(index: state.selectIndex, children: list),
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
                  // ref
                  //     .read(mainProvider.notifier)
                  //     .fetchProducts(isRefresh: true);
                },
                child: const AppLogo()),
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    ButtonEffect(
                      onTap: () {
                        ref.read(mainProvider.notifier).changeIndex(0,
                            onSuccess: () {
                          // ref.read(aboutProvider.notifier).fetchAbout(context);
                        });
                      },
                      child: Text(
                        "Асосий Сахифа",
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
                        ref.read(mainProvider.notifier).changeIndex(1,
                            onSuccess: () {
                          // ref.read(aboutProvider.notifier).fetchAbout(context);
                        });
                      },
                      child: Text(
                        "Таъвилот Ал-Қуръон ўкувчиларига",
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
                        "Дастур Хакида",
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
