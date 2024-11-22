// import 'package:admin_desktop/src/presentation/components/buttons/animation_button_effect.dart';
// import 'package:flutter/material.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:remixicon_updated/remixicon_updated.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../styles/style.dart';
//
//
//
// class PopButton extends StatelessWidget {
//   final VoidCallback? popSuccess;
//   const PopButton({super.key, this.popSuccess,});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ButtonEffect(
//       child: GestureDetector(
//         onTap:(){
//           // context.popRoute();
//          popSuccess != null
//              ? popSuccess!.call()
//              : context.popRoute();
//         } ,
//         child: Container(
//           width: 56.r,
//           height: 56.r,
//           decoration: BoxDecoration(
//             color: Style.black,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           alignment: Alignment.center,
//           child: Icon(
//            Remix.arrow_left_s_line,
//             color: Style.white,
//             size: 20.r,
//           ),
//         ),
//       ),
//     );
//   }
// }