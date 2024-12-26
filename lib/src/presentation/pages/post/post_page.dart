import 'dart:convert';
import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/utils/app_helpers.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../components/flutter_markdown/flutter_markdown.dart';
import '../../styles/style.dart';
import 'widgets/youtube_thumbnail.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(forStudentsProvider).isPostLoading
        ? const Center(child: Loading())
        : SingleChildScrollView(
            controller: _scrollController,
            padding: REdgeInsets.all(40),
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
                20.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                          color: Style.primary.withOpacity(0.3),
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Style.primary.withOpacity(0.3),
                          width: 2,
                        )),),
                  child: Markdown(
                    physics: const NeverScrollableScrollPhysics(),
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
                      styleSheet: MarkdownStyleSheet(
                        p: Style.interRegular(size: 20),
                        blockquotePadding: const EdgeInsets.all(12.0),
                        textAlign: WrapAlignment.center,
                      ),
                      data:
                          ref.watch(forStudentsProvider).category?.description ??
                              ""),
                ),
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
          );
  }
}
