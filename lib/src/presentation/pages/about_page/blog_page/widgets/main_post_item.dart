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
    required this.index,
  });

  final VoidCallback onTap;
  final String icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: REdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFC99F69).withOpacity(.85),
              borderRadius: BorderRadius.circular(15.r),
            ),
            height: 180.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(icon, height: 30, width: 30, color: Style.white),
                const Spacer(),
                Text(
                  title,
                  style: Style.interRegular(size: 24, color: Style.white),
                )
              ],
            ),
          ),
          Positioned(
            top: 10.r,
            right: index .isEven ? -30.r: -60.r,
            child: Image.asset(
              index.isEven ? "assets/png/blog_image.png" :
              "assets/png/blog_image_second.png",
              height: 180.r,
              width: 235.r,
            ),
          )
        ],
      ),
    );
  }
}
