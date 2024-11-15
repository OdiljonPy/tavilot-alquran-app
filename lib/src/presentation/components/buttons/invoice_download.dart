// import 'package:admin_desktop/generated/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../core/constants/constants.dart';
// import '../../../core/utils/app_helpers.dart';
// import '../../../models/models.dart';
// import '../../pages/main/widgets/order_detail/generate_check.dart';
// import '../../styles/style.dart';
// import 'animation_button_effect.dart';
//
// class InvoiceDownload extends StatelessWidget {
//   final OrderData? orderData;
//
//   const InvoiceDownload({super.key, required this.orderData});
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonEffectAnimation(
//       child: GestureDetector(
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return LayoutBuilder(builder: (context, constraints) {
//                   return SimpleDialog(
//                     title: SizedBox(
//                       height: constraints.maxHeight * 0.7,
//                       width: 300.r,
//                       child: GenerateCheckPage(orderData: orderData),
//                     ),
//                   );
//                 });
//               });
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
//           decoration: BoxDecoration(
//             color: Style.invoiceColor,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               SvgPicture.asset(
//                 Assets.svgFilePdf,
//                 height: 18,
//                 width: 18,
//               ),
//               8.horizontalSpace,
//               Text(
//                 AppHelpers.getTranslation(TrKeys.invoiceDownload),
//                 style: GoogleFonts.inter(
//                   fontSize: 14,
//                   letterSpacing: 0,
//                   color: Style.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
