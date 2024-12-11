import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../components/components.dart';
import '../../../../styles/style.dart';

class MainPostItem extends StatelessWidget {
  const MainPostItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback onTap;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Style.secondary,
          borderRadius: BorderRadius.circular(15.r),
        ),
        height: 180.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, height: 30, width: 30, color: Style.black),
            const Spacer(),
            Text(
              title,
              style: Style.interRegular(size: 24, color: Style.black),
            )
          ],
        ),
      ),
    );
  }
}
