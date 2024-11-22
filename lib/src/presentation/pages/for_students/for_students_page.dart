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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ta`vilot al quran oquvchilariga",
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
              return Container(
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
                          "${ref.watch(forStudentsProvider).categories[index].name}",
                          style: Style.interRegular(size: 24)),
                      14.verticalSpace,
                      Text(
                        "${ref.watch(forStudentsProvider).categories[index].title}",
                        style: Style.interRegular(size: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
