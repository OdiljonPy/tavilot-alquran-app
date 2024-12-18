import 'package:al_quran/src/models/response/get_categories_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/components.dart';
import '../../../styles/style.dart';

class SingleCategoryItem extends StatelessWidget {
  final VoidCallback onTap;
  final GetCategory singleCategory;
  const SingleCategoryItem({
    super.key, required this.onTap,
    required this.singleCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Style.primary.withOpacity(.7),
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
                color: Style.white,
              ),
              30.verticalSpace,
              Text(
                "${singleCategory.title}",
                style: Style.interRegular(size: 24, color: Style.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
