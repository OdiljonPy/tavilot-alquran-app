// import 'package:admin_desktop/src/presentation/components/buttons/animation_button_effect.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../core/utils/utils.dart';
//
// class StatusButton extends StatelessWidget {
//   final String status;
//   final VoidCallback? onTap;
//   final double verticalPadding;
//   final double horizontalPadding;
//
//   const StatusButton({
//     super.key,
//     required this.status,
//     this.onTap,
//     this.verticalPadding = 6,
//     this.horizontalPadding = 16,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonEffect(
//       onTap: onTap,
//       child: SizedBox(
//         width: 120.w,
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                   color: AppHelpers.getStatusColor(status).withOpacity(0.16),
//                   borderRadius: BorderRadius.circular(100)),
//               child: Text(
//                 AppHelpers.getTranslation(status),
//                 style: GoogleFonts.inter(
//                   fontSize: 16,
//                   color: AppHelpers.getStatusColor(status),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
