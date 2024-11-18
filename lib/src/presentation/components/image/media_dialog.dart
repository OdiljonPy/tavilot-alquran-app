// import 'package:admin_desktop/src/models/models.dart';
// import 'package:admin_desktop/src/presentation/components/components.dart';
// import 'package:flutter/material.dart';
// import 'package:remixicon_updated/remixicon_updated.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/constants/constants.dart';
// import '../../../core/utils/utils.dart';
// import '../../pages/main/widgets/add_product/riverpod/media/media_provider.dart';
// import '../../styles/style.dart';
// import 'custom_image_picker.dart';
// import 'video_item.dart';
//
// class MediaDialog extends ConsumerWidget {
//   final ValueChanged<String> onImageChange;
//   final ValueChanged<Galleries> onUpload;
//
//   const MediaDialog(
//       {super.key, required this.onImageChange, required this.onUpload});
//
//   @override
//   Widget build(BuildContext context, ref) {
//     final notifier = ref.read(mediaProvider.notifier);
//     final state = ref.watch(mediaProvider);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (state.videoPath == null)
//           Row(
//             children: [
//               _image(context),
//               12.horizontalSpace,
//               _video(notifier.setVideo),
//             ],
//           ),
//         if (state.videoPath != null)
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               VideoItem(
//                 url: state.videoPath,
//                 height: 180,
//                 isNetwork: false,
//                 width: MediaQuery.sizeOf(context).width / 1.4,
//               ),
//               12.verticalSpace,
//               Text('${AppHelpers.getTranslation(TrKeys.preview)}*'),
//               4.verticalSpace,
//               CustomImagePicker(
//                 imageFilePath: state.imagePath,
//                 onImageChange: notifier.setPreview,
//                 onDelete: notifier.deletePreview,
//                 width: MediaQuery.sizeOf(context).width / 1.4,
//               ),
//               12.verticalSpace,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   LoginButton(
//                     bgColor: Style.bg,
//                     title: TrKeys.cancel,
//                     titleColor: Style.black,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   6.horizontalSpace,
//                   LoginButton(
//                     isLoading: state.isLoading,
//                     title: TrKeys.save,
//                     onPressed: () {
//                       if (state.imagePath == null) {
//                         AppHelpers.showSnackBar(context,
//                              AppHelpers.getTranslation(
//                                 TrKeys.pleaseSelectPreview));
//                       } else {
//                         notifier.upload(context, onSuccess: (s) {
//                           onUpload.call(s);
//                           Navigator.pop(context);
//                         });
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//       ],
//     );
//   }
//
//   _image(BuildContext context) {
//     return ButtonEffect(
//       onTap: () {
//         Delayed(milliseconds: 500).run(() async {
//           AppHelpers.getPhotoGallery(onImageChange);
//         });
//         Navigator.pop(context);
//       },
//       child: Container(
//         height: 124,
//         width: 124,
//         decoration: BoxDecoration(
//           color: Style.bg,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Remix.image_add_line,
//               color: Style.colorGrey,
//               size: 24.r,
//             ),
//             Text(
//               AppHelpers.getTranslation(TrKeys.image),
//               style: Style.interNormal(color: Style.colorGrey, size: 14),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   _video(Function(String) onChange) {
//     return ButtonEffect(
//       onTap: () async => AppHelpers.getVideoGallery(onChange),
//       child: Container(
//         height: 124,
//         width: 124,
//         decoration: BoxDecoration(
//           color: Style.bg,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               Remix.video_upload_line,
//               color: Style.colorGrey,
//               size: 24.r,
//             ),
//             Text(
//               AppHelpers.getTranslation(TrKeys.video),
//               style: Style.interNormal(color: Style.colorGrey, size: 14),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
