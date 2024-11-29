import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/models/response/categories_response.dart';
import 'package:al_quran/src/presentation/components/buttons/animation_button_effect.dart';
import 'package:al_quran/src/presentation/components/buttons/custom_back_button.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:al_quran/src/presentation/pages/post/post_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../styles/style.dart';

class ForStudentsPage extends ConsumerWidget {
  const ForStudentsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: REdgeInsets.all(40),
      child: ref.read(forStudentsProvider).selectedIndex == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(
                    onTap: () =>
                        ref.read(mainProvider.notifier).changeIndex(0)),
                90.verticalSpace,
                Text(
                  LocaleKeys.forStudent.tr(),
                  style: Style.interSemi(size: 28, color: Style.primary),
                ),
                60.verticalSpace,
                GridView.builder(
                  // padding: REdgeInsets.all(40),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12.r,
                      crossAxisSpacing: 12.r,
                      crossAxisCount: 3,
                      mainAxisExtent: 240.r),
                  itemCount: ref.watch(forStudentsProvider).categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItem(onTap: () {
                      ref.read(forStudentsProvider.notifier).changeIndex(
                          1,
                          context,
                          6);
                    }, category: ref.watch(forStudentsProvider).categories[index]);
                  },
                )
              ],
            )
          : const PostPage(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final VoidCallback onTap;
  final Category category;
  const CategoryItem({
    super.key, required this.onTap, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,

        // ref.read(forStudentsProvider.notifier).changeIndex(
        //     1,
        //     context,
        //     6);
      child: Container(
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: REdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/svg/forStudents.svg",
                height: 30.r,
                width: 30.r,
              ),
              30.verticalSpace,
              Text(
                  "${category.name}",
                  style: Style.interRegular(size: 24)),
              14.verticalSpace,
              Text(
                "${category.title}",
                style: Style.interRegular(size: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
