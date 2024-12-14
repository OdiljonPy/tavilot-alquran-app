import 'dart:convert';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../application/for_students/for_students_provider.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  Future<void> _launchYouTube(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in browser or YouTube app
      );
    } else {
      throw Exception('Could not launch $url');
    }
  }

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
                    data: ref.watch(forStudentsProvider).category?.description ?? ""),
                if (ref.watch(forStudentsProvider).category?.file != null)
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/png/pdf.png"),
                        20.verticalSpace,
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width/5,
                            child: LoginButton(title: "Yuklab olish", onPressed: (){
                              _launchYouTube(ref.watch(forStudentsProvider).category?.file ?? "");
                            })),
                      ],
                    ),
                  ),
                // ButtonEffect(
                //   onTap: (){
                //     _launchYouTube(ref.watch(forStudentsProvider).category?.file ?? "");
                //   },
                //   child: Container(
                //     child: Text("ddddddd"),
                //   ),
                // )

              ],
            ),
          );
  }
}
