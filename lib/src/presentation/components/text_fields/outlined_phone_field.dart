// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phone_text_field/phone_text_field.dart';
// import '../../../core/constants/constants.dart';
// import '../../../core/utils/utils.dart';
// import '../../styles/style.dart';
//
// class OutlinedPhoneField extends StatelessWidget {
//   final ValueChanged<String> onchange;
//   final String? initialValue;
//   final bool isHint;
//   final double radius;
//   final double borderWidth;
//
//   const OutlinedPhoneField(
//       {super.key,
//       required this.onchange,
//       this.initialValue,
//       this.radius =14,
//       this.borderWidth = 0.5,
//       this.isHint = false}
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     return PhoneTextField(
//       initialCountryCode: AppConstants.initialCountryCode,
//       initialValue: initialValue,
//       decoration: InputDecoration(
//         suffixIconConstraints: BoxConstraints(
//           maxHeight: 30.r,
//           maxWidth: 30.r,
//         ),
//         labelText:
//             isHint ? null : AppHelpers.getTranslation(TrKeys.phoneNumber),
//         hintText:
//             !isHint ? null : AppHelpers.getTranslation(TrKeys.phoneNumber),
//         hintStyle: Style.interNormal(
//           size: 12,
//           color: Style.textColor,
//         ),
//         contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Style.borderColor, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//         errorBorder: OutlineInputBorder(
//             borderSide:BorderSide(color: Style.red, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(color: Style.borderColor, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:BorderSide(color: Style.borderColor, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//         disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Style.shimmerBase, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Style.borderColor, width: borderWidth),
//             borderRadius: BorderRadius.circular(radius)),
//       ),
//       onChanged: (s) {
//         onchange.call(s.completeNumber);
//       },
//     );
//   }
// }
