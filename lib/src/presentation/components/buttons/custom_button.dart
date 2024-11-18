// import 'package:admin_desktop/src/presentation/components/components.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../styles/style.dart';
//
// class CustomButton extends StatelessWidget {
//   final Color? borderColor;
//   final Color? textColor;
//   final Color bgColor;
//   final String? title;
//   final Function()? onTap;
//   final bool? isLoading;
//
//   const CustomButton(
//       {super.key,
//       this.borderColor,
//       this.title,
//       this.textColor=Style.white,
//       this.bgColor=Style.primary,
//       this.onTap,
//       this.isLoading,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonEffect(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         width: 148,
//         decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: borderColor ?? Style.transparent)),
//         child: Center(
//           child: isLoading ?? false
//               ? const Loading()
//               : Text(
//                   title ?? '',
//                   style: GoogleFonts.inter(
//                       fontSize: 16,
//                       color: textColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//         ),
//       ),
//     );
//   }
// }
