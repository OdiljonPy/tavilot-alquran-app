import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/app_helpers.dart';
import '../../../core/utils/local_storage.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(right: 18,top: 6,bottom: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
                LocalStorage.getLangLtr()
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 32),
            Text(AppHelpers.getTranslation(TrKeys.back),
                style: Style.interNormal(size: 16)),
          ],
        ),
      ),
    );
  }
}
