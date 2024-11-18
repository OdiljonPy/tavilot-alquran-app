// import 'package:admin_desktop/src/core/constants/tr_keys.dart';
// import 'package:admin_desktop/src/core/utils/utils.dart';
// import 'package:admin_desktop/src/presentation/components/buttons/animation_button_effect.dart';
//
// import 'package:flutter/material.dart';
//
// import '../../styles/style.dart';
//
// class TitleScreen extends StatelessWidget {
//   final VoidCallback onTap;
//
//   const TitleScreen({super.key, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           AppHelpers.getTranslation(TrKeys.filter),
//           style: Style.interNormal(color: Style.black, size: 22),
//         ),
//         ButtonEffect(
//           onTap: onTap,
//           child: Text(
//             AppHelpers.getTranslation(TrKeys.clearAll),
//             style: Style.interNormal(color: Style.textColor, size: 14),
//           ),
//         ),
//       ],
//     );
//   }
// }
