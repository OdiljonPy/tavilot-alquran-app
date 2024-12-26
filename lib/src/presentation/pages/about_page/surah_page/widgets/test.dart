// import 'package:flutter/widgets.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
//
// class ArabicTextAware extends MarkdownElementBuilder {
//   static final RegExp _arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F]+');
//
//   @override
//   Widget? visitText(Text text, TextStyle? preferredStyle) {
//     final String textContent = text.data ?? '';
//     final List<InlineSpan> spans = [];
//
//     textContent.splitMapJoin(
//       _arabicRegex,
//       onMatch: (Match match) {
//         spans.add(
//           TextSpan(
//             text: match.group(0),
//             style: preferredStyle?.copyWith(
//               fontFamily: 'Amiri', // Arabic font
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         );
//         return '';
//       },
//       onNonMatch: (String nonArabic) {
//         spans.add(
//           TextSpan(
//             text: nonArabic,
//             style: preferredStyle?.copyWith(
//               fontFamily: 'Inter', // Default font
//             ),
//           ),
//         );
//         return '';
//       },
//     );
//
//     return RichText(
//       text: TextSpan(
//         children: spans,
//         style: preferredStyle,
//       ),
//       textAlign: TextAlign.justify,
//     );
//   }
// }