import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/app_helpers.dart';
import '../styles/style.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppConstants.heroLogo,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
            child: Image.asset(
              Assets.pngAppIcon,
              height: 40.r,
              width: 40.r,
            ),
          ),
          12.horizontalSpace,
          Text( "", style: Style.interSemi()),
        ],
      ),
    );
  }
}
