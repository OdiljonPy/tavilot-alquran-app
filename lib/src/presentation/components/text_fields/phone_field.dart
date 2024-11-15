// import 'package:admin_desktop/src/core/constants/constants.dart';
// import 'package:admin_desktop/src/core/utils/utils.dart';
// import 'package:admin_desktop/src/presentation/styles/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phone_text_field/phone_text_field.dart';
//
// class PhoneField extends StatelessWidget {
//   final ValueChanged<String> onchange;
//   final String? initialValue;
//
//   const PhoneField(
//       {super.key, required this.onchange, required this.initialValue});
//
//   @override
//   Widget build(BuildContext context) {
//     return PhoneTextField(
//       initialValue: initialValue,
//       decoration: InputDecoration(
//         suffixIconConstraints: BoxConstraints(
//           maxHeight: 30.r,
//           maxWidth: 30.r,
//         ),
//         hintText: AppHelpers.getTranslation(TrKeys.phoneNumber),
//         hintStyle: Style.interNormal(
//           size: 12,
//           color: Style.textColor,
//         ),
//         contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         enabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Style.shimmerBase),
//         ),
//         errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Style.red),
//         ),
//         border: const UnderlineInputBorder(),
//         focusedErrorBorder: const UnderlineInputBorder(),
//         disabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Style.shimmerBase),
//         ),
//         focusedBorder: const UnderlineInputBorder(),
//       ),
//       onChanged: (s) {
//         onchange.call(s.completeNumber);
//       },
//     );
//   }
// }
