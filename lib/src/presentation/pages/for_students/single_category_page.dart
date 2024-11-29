import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../components/components.dart';
import 'category_item/single_category_iyem.dart';

class SingleCategoryPage extends ConsumerWidget {
  const SingleCategoryPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(onTap: () {
          ref.read(forStudentsProvider.notifier).changeIndex(0, context);
        }),
        90.verticalSpace,
        ref.watch(forStudentsProvider).isSingleCategoriesLoading
            ? SizedBox(
                height: MediaQuery.sizeOf(context).height * .6,
                child: const Loading())
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 12.r,
                    crossAxisSpacing: 12.r,
                    crossAxisCount: 3,
                    mainAxisExtent: 240.r),
                itemCount:
                    ref.watch(forStudentsProvider).singleCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleCategoryItem(
                      onTap: () {
                        ref.read(forStudentsProvider.notifier).changeIndex(
                              2,
                              context,
                              onSuccess: () => ref
                                  .read(forStudentsProvider.notifier)
                                  .fetchPost(context,
                                      id: ref
                                              .watch(forStudentsProvider)
                                              .singleCategories[index]
                                              .id ??
                                          0),
                            );
                      },
                      singleCategory: ref
                          .watch(forStudentsProvider)
                          .singleCategories[index]);
                },
              )
      ],
    );
  }
}
