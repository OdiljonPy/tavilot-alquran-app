import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/post/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
            child: Expanded(
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
                  Html(
                    data: ref.watch(forStudentsProvider).post?.description ?? "",
                  ),
                  if (ref.watch(forStudentsProvider).post?.file != null)
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height *.7,
                    child: WebViewPage(
                        url: ref.watch(forStudentsProvider).post?.file ?? ""),
                  ),
                ],
              ),
            ),
          );
  }
}
