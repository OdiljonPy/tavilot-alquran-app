import 'package:al_quran/src/presentation/pages/for_students/single_category_page.dart';
import 'package:al_quran/src/presentation/pages/post/post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';

class ForStudentsPage extends ConsumerWidget {
  const ForStudentsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(forStudentsProvider).selectedIndex == 0
        ? const SingleCategoryPage()
        :  const PostPage(

    );
  }
}
