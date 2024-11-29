import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/response/categories_response.dart';
import '../../../components/components.dart';
import '../../../styles/style.dart';

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
