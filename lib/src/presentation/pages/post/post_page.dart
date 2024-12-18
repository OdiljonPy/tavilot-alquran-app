import 'dart:convert';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/utils/app_helpers.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../styles/style.dart';
import 'widgets/youtube_thumbnail.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {

  @override
  Widget build(BuildContext context) {
    return ref.watch(forStudentsProvider).isPostLoading
        ? const Center(child: Loading())
        : SingleChildScrollView(
            padding: REdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset("assets/png/frame.png", fit: BoxFit.fill,)),
                20.horizontalSpace,
                Expanded(
                  flex: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(onTap: () {
                        ref
                            .read(forStudentsProvider.notifier)
                            .changeIndex(0, context);
                      }),
                      90.verticalSpace,
                      Text(
                        ref.watch(forStudentsProvider).category?.title ?? "",
                      ),
                      Markdown(
                          shrinkWrap: true,
                          imageBuilder: (uri, title, alt) {
                            final base64String = uri.toString().split(',').last;
                            try {
                              final imageBytes = base64Decode(base64String);
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.memory(
                                  imageBytes,
                                ),
                              );
                            } catch (e) {
                              // Handle decoding errors
                              return const Icon(Icons.error, color: Colors.red);
                            }
                          },
                          data:
                              ref.watch(forStudentsProvider).category?.description ??
                                  ""),
                      if (ref.watch(forStudentsProvider).category?.file != null)
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/png/pdf.png"),
                              20.verticalSpace,
                              Text(ref.watch(forStudentsProvider).category?.fileName ??
                                  "", style: Style.interRegular(size: 20)),
                              20.verticalSpace,
                              SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 5,
                                  child: LoginButton(
                                      title: LocaleKeys.download.tr(),
                                      onPressed: () {
                                        AppHelpers.launchExternalUrl(ref
                                                .watch(forStudentsProvider)
                                                .category
                                                ?.file ??
                                            "");
                                      })),
                            ],
                          ),
                        ),
                      if (ref.watch(forStudentsProvider).category?.youtubeUrl !=
                              null &&
                          ref.watch(forStudentsProvider).category?.youtubeUrl != "")
                        YouTubeThumbnail(
                            videoUrl:
                                ref.watch(forStudentsProvider).category?.youtubeUrl ??
                                    "", ),
                    ],
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                    flex: 1,
                    child: Image.asset("assets/png/frame.png", fit: BoxFit.fill,)),              ],
            ),
          );
  }
}
