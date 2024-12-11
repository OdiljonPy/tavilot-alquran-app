// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../application/for_students/for_students_provider.dart';
// import '../../../../infrastructure/translations/locale_keys.g.dart';
// import '../../components/components.dart';
// import '../../styles/style.dart';
// import '../main/riverpod/provider/main_provider.dart';
// import 'category_item/category_item.dart';
//
// class CategoryList extends ConsumerWidget {
//   const CategoryList({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context, ref) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomBackButton(
//             onTap: () => ref.read(mainProvider.notifier).changeIndex(0)),
//         90.verticalSpace,
//         Text(
//           LocaleKeys.forStudent.tr(),
//           style: Style.interSemi(size: 28, color: Style.primary),
//         ),
//         60.verticalSpace,
//         GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisSpacing: 12.r,
//               crossAxisSpacing: 12.r,
//               crossAxisCount: 3,
//               mainAxisExtent: 240.r),
//           itemCount: ref.watch(forStudentsProvider).categories.length,
//           itemBuilder: (BuildContext context, int index) {
//             return CategoryItem(
//                 onTap: () {
//                   ref.read(forStudentsProvider.notifier).changeIndex(1, context,
//                       onSuccess: () {
//                     ref.read(forStudentsProvider.notifier).fetchCategory(
//                         context,
//                         id: ref
//                                 .watch(forStudentsProvider)
//                                 .categories[index]
//                                 .id ??
//                             0);
//                   });
//                 },
//                 category: ref.watch(forStudentsProvider).categories[index]);
//           },
//         )
//       ],
//     );
//   }
// }
