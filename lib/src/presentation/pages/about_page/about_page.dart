import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../application/about/about_provider.dart';
import '../main/riverpod/provider/main_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ListView(
      padding: REdgeInsets.all(40),
      children: [
        ref.watch(aboutProvider).isAboutLoading
            ? SizedBox(
              height: MediaQuery.sizeOf(context).height,
            child: const Loading())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(onTap: () => ref.read(mainProvider.notifier).changeIndex(0)),
                90.verticalSpace,
                Html(data: ref.watch(aboutProvider).about?.description ?? ''),
              ],
            ),
      ],
    );
  }
}
