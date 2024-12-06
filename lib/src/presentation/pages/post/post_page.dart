import 'dart:convert';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/post/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/for_students/for_students_provider.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {

  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    // _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(forStudentsProvider).isPostLoading
        ? const Center(child: Loading())
        : SingleChildScrollView(
            padding: REdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(onTap: () {
                  ref
                      .read(forStudentsProvider.notifier)
                      .changeIndex(1, context);
                }),
                90.verticalSpace,
                Text(
                  ref.watch(forStudentsProvider).post?.title ?? "",
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
                    data: ref.watch(forStudentsProvider).post?.description ?? ""),
                if (ref.watch(forStudentsProvider).post?.file != null)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height *.7,
                  child: WebViewPage(
                      url: ref.watch(forStudentsProvider).post?.file ?? ""),
                ),
              ],
            ),
          );
  }
}
