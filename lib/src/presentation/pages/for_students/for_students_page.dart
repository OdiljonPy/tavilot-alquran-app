import 'package:al_quran/src/presentation/pages/for_students/single_category_page.dart';
import 'package:al_quran/src/presentation/pages/post/post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';
import 'category_list.dart';

class ForStudentsPage extends ConsumerWidget {
  const ForStudentsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: ref.watch(forStudentsProvider).selectedIndex == 2
          ? EdgeInsets.zero
          : REdgeInsets.all(40),
      child: ref.watch(forStudentsProvider).selectedIndex == 0
          ? const CategoryList()
          : ref.watch(forStudentsProvider).selectedIndex == 1
              ? const SingleCategoryPage()
              : const PostPage(),
    );
  }
}
