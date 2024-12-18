import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/utils.dart';
import '../styles/style.dart';
import 'buttons/animation_button_effect.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isActive;
  final Color bgColor;
  final Color titleColor;
  final double borderRadius;
  final double? height;
  final Function()? onPressed;

  const LoginButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isActive = true,
    this.bgColor = Style.primary,
    this.titleColor = Style.white,
    this.borderRadius = 8,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: isActive ? bgColor : Style.selectedItemsText,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            height: height ?? 60.r,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                    color: isActive?  Style.primary: Style.selectedItemsText)),
            alignment: Alignment.center,
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Style.white,
                    ),
                  )
                : Text(
              AppHelpers.getTranslation(title),
                    style: GoogleFonts.cormorant(
                      fontSize: 24,
                      color: isActive ? titleColor : Style.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                      fontFeatures: [const FontFeature.liningFigures()],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
