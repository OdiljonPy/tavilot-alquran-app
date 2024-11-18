import 'package:al_quran/src/presentation/pages/for_students/for_students_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
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

  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mainProvider.notifier)
        ..changeIndex(0)
        ..fetchChapters(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismisser(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(mainProvider);
            // final customerNotifier = ref.read(customerProvider.notifier);
            final notifier = ref.read(mainProvider.notifier);
            return Scaffold(
              appBar: customAppBar(notifier),
              body: ProsteIndexedStack(
                  index: state.selectIndex, children: list),
            );
          },
        ),
      ),
    );
  }

  AppBar customAppBar(MainNotifier notifier) {
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
                    Text(
                      "Асосий Сахифа",
                      style: Style.interRegular(size: 14),
                    ),
                    36.horizontalSpace,
                    Text(
                      "Таъвилот Ал-Қуръон ўкувчиларига",
                      style: Style.interRegular(size: 14),
                    ),
                    36.horizontalSpace,
                    Text(
                      "Дастур Хакида",
                      style: Style.interRegular(size: 14),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

// AppBar customAppBar(
//     MainNotifier notifier, CustomerNotifier customerNotifier) {
//   return AppBar(
//     backgroundColor: Style.white,
//     automaticallyImplyLeading: false,
//     elevation: 0.5,
//     title: IntrinsicHeight(
//       child: ThemeWrapper(
//         builder: (colors, controller) {
//           return Row(
//             children: [
//               16.horizontalSpace,
//               GestureDetector(
//                   onTap: () {
//                     ref
//                         .read(mainProvider.notifier)
//                         .fetchProducts(isRefresh: true);
//                   },
//                   child: const AppLogo()),
//               const VerticalDivider(),
//               30.horizontalSpace,
//               Expanded(
//                 child: Row(
//                   children: [
//                     const Icon(
//                       FlutterRemix.search_2_line,
//                       size: 20,
//                       color: Style.black,
//                     ),
//                     17.horizontalSpace,
//                     Expanded(
//                       flex: 2,
//                       child: TextFormField(
//                         onChanged: (value) {
//                           if (user?.role == TrKeys.seller) {
//                             ref.watch(mainProvider).selectIndex == 3
//                                 ? customerNotifier.searchUsers(
//                                     context, value.trim())
//                                 : notifier.setProductsQuery(
//                                     context, value.trim());
//                             if (ref.watch(mainProvider).selectIndex == 6) {
//                               if (ref.watch(profileProvider).selectIndex ==
//                                   4) {
//                                 ref
//                                     .read(addressProvider.notifier)
//                                     .searchCountry(
//                                         context: context,
//                                         search: value.trim());
//                               } else if (ref
//                                       .watch(profileProvider)
//                                       .selectIndex ==
//                                   5) {
//                                 ref.read(addressProvider.notifier).searchCity(
//                                     context: context,
//                                     search: value.trim(),
//                                     countyId:
//                                         ref.watch(addressProvider).countryId);
//                               }
//                             }
//                           }
//                         },
//                         cursorColor: Style.black,
//                         cursorWidth: 1.r,
//                         decoration: InputDecoration.collapsed(
//                           hintText: AppHelpers.getTranslation(ref
//                                       .watch(mainProvider)
//                                       .selectIndex ==
//                                   1
//                               ? TrKeys.searchOrders
//                               : ref.watch(mainProvider).selectIndex == 2
//                                   ? ref.watch(productProvider).stateIndex == 0
//                                       ? TrKeys.searchProducts
//                                       : ref
//                                                   .watch(productProvider)
//                                                   .stateIndex ==
//                                               3
//                                           ? TrKeys.searchBrands
//                                           : TrKeys.searchCategory
//                                   : ref.watch(mainProvider).selectIndex == 3
//                                       ? AppHelpers.getTranslation(
//                                           TrKeys.searchComments)
//                                       : ref.watch(mainProvider).selectIndex ==
//                                               6
//                                           ? ref
//                                                       .watch(profileProvider)
//                                                       .selectIndex ==
//                                                   4
//                                               ? TrKeys.searchCountry
//                                               : ref
//                                                           .watch(
//                                                               profileProvider)
//                                                           .selectIndex ==
//                                                       5
//                                                   ? TrKeys.searchCity
//                                                   : AppHelpers.getTranslation(
//                                                       TrKeys.searchLocation)
//                                           : TrKeys.search),
//                           hintStyle: GoogleFonts.inter(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: Style.searchHint.withOpacity(0.3),
//                             letterSpacing: -14 * 0.02,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const VerticalDivider(),
//               SizedBox(width: 120.w, child: DigitalClock()),
//               const VerticalDivider(),
//               IconButton(
//                   onPressed: () async {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const WebViewPage(url: "${SecretVars.webUrl}/help"),
//                     ));                      // await launch(
//                     //   "${SecretVars.webUrl}/help",
//                     //   forceSafariVC: true,
//                     //   forceWebView: true,
//                     //   enableJavaScript: true,
//                     // );
//                   },
//                   icon: const Icon(
//                     FlutterRemix.question_line,
//                     color: Style.black,
//                   )),
//               // IconButton(
//               //     onPressed: () {},
//               //     icon: const Icon(
//               //       FlutterRemix.settings_5_line,
//               //       color: Style.black,
//               //     )),
//               Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: IconButton(
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (_) => const Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Dialog(child: NotificationDialog()),
//                                     ],
//                                   ));
//                         },
//                         icon: const Icon(
//                           FlutterRemix.notification_2_line,
//                           color: Style.black,
//                         )),
//                   ),
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: NotificationCountsContainer(
//                         count: ref
//                             .watch(notificationProvider)
//                             .countOfNotifications
//                             ?.notification),
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () {
//                   ref.read(languagesProvider.notifier).getLanguages(context);
//                   showDialog(
//                       context: context,
//                       builder: (_) => Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Dialog(
//                                 alignment: Alignment.topRight,
//                                 child: SizedBox(
//                                   height:
//                                       MediaQuery.sizeOf(context).height / 2,
//                                   width: MediaQuery.sizeOf(context).width / 4,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: REdgeInsets.only(
//                                             left: 15, right: 15, top: 15),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               AppHelpers.getTranslation(
//                                                   TrKeys.language),
//                                               style: GoogleFonts.inter(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 22,
//                                                 color: Style.black,
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             IconButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 icon: const Icon(
//                                                     FlutterRemix.close_fill))
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: LanguagesModal(
//                                           afterUpdate: () {
//                                             controller.toggle();
//                                             controller.toggle();
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ));
//                 },
//                 icon: const Icon(
//                   FlutterRemix.global_line,
//                   color: Style.black,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (_) => Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Dialog(
//                                 child: SizedBox(
//                                   height:
//                                       MediaQuery.sizeOf(context).height / 1.2,
//                                   width: MediaQuery.sizeOf(context).width / 4,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: REdgeInsets.only(
//                                             left: 15, right: 15, top: 15),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               AppHelpers.getTranslation(
//                                                   TrKeys.menu),
//                                               style: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 22,
//                                                   color: Style.black),
//                                             ),
//                                             const Spacer(),
//                                             IconButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 icon: const Icon(
//                                                     FlutterRemix.close_fill))
//                                           ],
//                                         ),
//                                       ),
//                                       const Expanded(child: MenuModal()),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ));
//                 },
//                 icon: const Icon(
//                   FlutterRemix.menu_2_line,
//                   color: Style.black,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     ),
//   );
// }

// Container bottomLeftNavigationBar(MainState state) {
//   return Container(
//     height: double.infinity,
//     width: 90.w,
//     color: Style.white,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         24.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 0 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(0);
//               },
//               icon: Icon(
//                 state.selectIndex == 0
//                     ? FlutterRemix.home_smile_fill
//                     : FlutterRemix.home_smile_line,
//                 color: state.selectIndex == 0 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 1 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(1);
//               },
//               icon: Icon(
//                 state.selectIndex == 1
//                     ? FlutterRemix.shopping_bag_fill
//                     : FlutterRemix.shopping_bag_line,
//                 color: state.selectIndex == 1 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 2 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(2);
//               },
//               icon: Icon(
//                 state.selectIndex == 2 ? FlutterRemix.calendar_todo_fill : FlutterRemix.calendar_todo_line,
//                 color: state.selectIndex == 2 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 3 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(3);
//               },
//               icon: Icon(
//                 state.selectIndex == 3
//                     ? FlutterRemix.chat_1_fill
//                     : FlutterRemix.chat_1_line,
//                 color: state.selectIndex == 3 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 4 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(4);
//               },
//               icon: Icon(
//                 state.selectIndex == 4
//                     ? FlutterRemix.money_dollar_circle_fill
//                     : FlutterRemix.money_dollar_circle_line,
//                 color: state.selectIndex == 4 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//                   state.selectIndex == 5 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(5);
//               },
//               icon: Icon(
//                 state.selectIndex == 5
//                     ? FlutterRemix.pie_chart_fill
//                     : FlutterRemix.pie_chart_line,
//                 color: state.selectIndex == 5 ? Style.white : Style.iconColor,
//               )),
//         ),
//         28.verticalSpace,
//         Container(
//           decoration: BoxDecoration(
//               color:
//               state.selectIndex == 6 ? Style.primary : Style.transparent,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: IconButton(
//               onPressed: () {
//                 ref.read(mainProvider.notifier).changeIndex(6);
//               },
//               icon: Icon(
//                 state.selectIndex == 6
//                     ? FlutterRemix.box_1_fill
//                     : FlutterRemix.box_1_line,
//                 color: state.selectIndex == 6 ? Style.white : Style.iconColor,
//               )),
//         ),
//         const Spacer(),
//         InkWell(
//           onTap: () {
//             ref.read(mainProvider.notifier).changeIndex(7);
//           },
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: state.selectIndex == 7
//                       ? Style.primary
//                       : Style.transparent,
//                 ),
//                 borderRadius: BorderRadius.circular(20.r)),
//             child: CommonImage(
//                 width: 40,
//                 height: 40,
//                 radius: 20,
//                 url: LocalStorage.getUser()?.img ?? ""),
//           ),
//         ),
//         24.verticalSpace,
//         IconButton(
//             onPressed: () {
//               context.replaceRoute(const LoginRoute());
//               ref.read(newOrdersProvider.notifier).stopTimer();
//               ref.read(acceptedOrdersProvider.notifier).stopTimer();
//               ref.read(readyOrdersProvider.notifier).stopTimer();
//               ref.read(onAWayOrdersProvider.notifier).stopTimer();
//               ref.read(deliveredOrdersProvider.notifier).stopTimer();
//               ref.read(canceledOrdersProvider.notifier).stopTimer();
//               LocalStorage.clearStore();
//             },
//             icon: const Icon(
//               FlutterRemix.logout_circle_line,
//               color: Style.iconColor,
//             )),
//         32.verticalSpace,
//       ],
//     ),
//   );
// }
}
