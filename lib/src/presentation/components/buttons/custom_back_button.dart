import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/app_helpers.dart';
import '../../styles/style.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Style.primary.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Style.primary.withOpacity(0.3)),
        ),
        padding: REdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FlutterRemix.arrow_left_s_line,
                size:24.r),
            8.horizontalSpace,
            Text(AppHelpers.getTranslation(TrKeys.back),
                style: Style.interNormal(size: 16)),
          ],
        ),
      ),
    );
  }
}