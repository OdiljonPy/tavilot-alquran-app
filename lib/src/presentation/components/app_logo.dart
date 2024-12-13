import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppConstants.heroLogo,
      child: SizedBox(
        width: 52.r,
        child: Image.asset(
          'assets/png/blog_logo.png',
          height: 52.r,
          width: 52.r,
        ),
      ),
    );
  }
}
