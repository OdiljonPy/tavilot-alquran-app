import 'package:al_quran/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../styles/style.dart';

class CustomPopupItem extends StatelessWidget {
  final VoidCallback onTap;
  const CustomPopupItem({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 20.r,
      constraints: BoxConstraints(
        maxWidth: 120.r,
      ),
      tooltip: LocaleKeys.chooseLang.tr(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 1,
      padding: EdgeInsets.zero,
      icon: SizedBox(
        width: 42.r,
        height: 42.r,
        child: Center(
            child: SvgPicture.asset("assets/svg/lang.svg")),
      ),
      itemBuilder: (c) {
        return [
            _buildPopupMenuItem(
              context: context,
              title: LocaleKeys.register.tr(),
              onTap: () {
                Navigator.pop(c);
                context.setLocale(const Locale('uz', 'UZ'));
                onTap();
                print("${currentLocale?.countryCode?.toLowerCase()}");
              },
            ),
            _buildPopupMenuItem(
              context: context,
              title: LocaleKeys.register.tr(),
              onTap: () {
                Navigator.pop(c);
                context.setLocale(const Locale('ru', 'RU'));
                onTap();
                print("${currentLocale?.countryCode?.toLowerCase()}");
              },
            ),
        ];
      },
    );
  }

  PopupMenuItem _buildPopupMenuItem({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:REdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
              width: 0.3.r,
            ),
          ),
          child: Text(
            title,
            style: Style.interNormal(
                size: 8,
                color: textColor ?? Style.black),
          ),
        ),
      ),
    );
  }
}
