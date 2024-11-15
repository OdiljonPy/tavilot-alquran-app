import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/utils.dart';
import '../../components/components.dart';
import '../../styles/style.dart';
import 'riverpod/provider/main_provider.dart';


@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  final user = LocalStorage.getUser();

  // late List<IndexedStackChild> list = [
  //   IndexedStackChild(child: const PostPage(), preload: true),
  //   IndexedStackChild(child: const OrdersTablesPage()),
  //   IndexedStackChild(child: const ServicePage()),
  //   IndexedStackChild(child: const CommentsPage()),
  //   IndexedStackChild(child: const SaleHistory()),
  //   IndexedStackChild(child: const InComePage()),
  //   IndexedStackChild(child: const CataloguePage()),
  //   IndexedStackChild(child: const ProfilePage()),
  // ];

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid || Platform.isIOS) {
    //   FirebaseMessaging.instance.requestPermission(
    //     sound: true,
    //     alert: true,
    //     badge: false,
    //   );
    // }
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(mainProvider.notifier)
    //     ..changeIndex(0)
    //     ..fetchMyShop()
    //     ..fetchUserDetail(onSuccess: () {
    //       ref.read(mainProvider.notifier)
    //         ..fetchProducts(
    //           isRefresh: true,
    //           checkYourNetwork: () {
    //             AppHelpers.showSnackBar(
    //               context,
    //               AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
    //             );
    //           },
    //         )
    //         ..fetchCategories(
    //           context: context,
    //           checkYourNetwork: () {
    //             AppHelpers.showSnackBar(
    //               context,
    //               AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
    //             );
    //           },
    //         );
    //       ref.read(languagesProvider.notifier).checkLanguage();
    //     });
    //
    //   ref.read(rightSideProvider.notifier).fetchUsers(
    //     checkYourNetwork: () {
    //       AppHelpers.showSnackBar(
    //         context,
    //         AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
    //       );
    //     },
    //   );
    //   if (mounted) {
    //     Timer.periodic(
    //       AppConstants.refreshTime,
    //       (s) {
    //         ref.read(notificationProvider.notifier).fetchCount(context);
    //       },
    //     );
    //   }
    // });
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
            return Scaffold();
          },
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
  //                       Remix.search_2_line,
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
  //                     Remix.question_line,
  //                     color: Style.black,
  //                   )),
  //               // IconButton(
  //               //     onPressed: () {},
  //               //     icon: const Icon(
  //               //       Remix.settings_5_line,
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
  //                           Remix.notification_2_line,
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
  //                                                     Remix.close_fill))
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
  //                   Remix.global_line,
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
  //                                                     Remix.close_fill))
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
  //                   Remix.menu_2_line,
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
  //                     ? Remix.home_smile_fill
  //                     : Remix.home_smile_line,
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
  //                     ? Remix.shopping_bag_fill
  //                     : Remix.shopping_bag_line,
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
  //                 state.selectIndex == 2 ? Remix.calendar_todo_fill : Remix.calendar_todo_line,
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
  //                     ? Remix.chat_1_fill
  //                     : Remix.chat_1_line,
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
  //                     ? Remix.money_dollar_circle_fill
  //                     : Remix.money_dollar_circle_line,
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
  //                     ? Remix.pie_chart_fill
  //                     : Remix.pie_chart_line,
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
  //                     ? Remix.box_1_fill
  //                     : Remix.box_1_line,
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
  //               Remix.logout_circle_line,
  //               color: Style.iconColor,
  //             )),
  //         32.verticalSpace,
  //       ],
  //     ),
  //   );
  // }
}
