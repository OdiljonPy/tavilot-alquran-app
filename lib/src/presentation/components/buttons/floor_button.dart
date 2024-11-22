// import 'package:admin_desktop/src/presentation/components/buttons/animation_button_effect.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../styles/style.dart';
//
//
// class SectionButton extends StatelessWidget {
//   final String title;
//   final Widget? icon;
//   final Widget? prefixIcon;
//   final double height;
//   final bool isLoading;
//   final bool isActive;
//   final bool isTab;
//   final bool isShadow;
//   final Color bgColor;
//   final Color borderColor;
//   final Color textColor;
//   final double? textSize;
//   final double? paddingSize;
//   final Function()? onTap;
//
//   const SectionButton({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.height = 50,
//     this.isLoading = false,
//     this.isActive = true,
//     this.bgColor = Style.primary,
//     this.borderColor = Style.transparent,
//     this.textColor = Style.white,
//     this.icon,
//     this.prefixIcon,
//     this.textSize,
//     this.paddingSize,
//     this.isTab = false,
//     this.isShadow = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonEffect(
//       child: Material(
//         borderRadius: BorderRadius.circular(15.r),
//         color: isActive ? bgColor : Style.white,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(15.r),
//           onTap: isTab
//               ? onTap
//               : isActive
//                   ? onTap
//                   : null,
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 border: Border.all(color: borderColor),
//                 color: isActive ? bgColor : Style.white,
//                 boxShadow: isShadow
//                     ? [
//                         BoxShadow(
//                           blurRadius: 2,
//                           offset: const Offset(0, 1),
//                           color: Style.black.withOpacity(0.07),
//                         )
//                       ]
//                     : []),
//             height: height.r,
//             padding: REdgeInsets.symmetric(horizontal: paddingSize ?? 24),
//             alignment: Alignment.center,
//             child: isLoading
//                 ? SizedBox(
//                     height: 24.r,
//                     width: 24.r,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2.r,
//                       color: isActive ? Style.white : Style.black,
//                     ),
//                   )
//                 : icon ??
//                     Row(
//                       children: [
//                         prefixIcon ?? const SizedBox.shrink(),
//                         prefixIcon != null
//                             ? 12.horizontalSpace
//                             : const SizedBox.shrink(),
//                         Text(
//                           title,
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w500,
//                             fontSize: textSize?.sp ?? 14.sp,
//                             color: isActive
//                                 ? Style.black
//                                 : Style.reviewText,
//                           ),
//                         )
//                       ],
//                     ),
//           ),
//         ),
//       ),
//     );
//   }
// }