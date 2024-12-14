import 'dart:convert';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
                        return const Icon(Icons.error, color: Colors.red);
                      }
                    },
                    data: ref.watch(aboutProvider).about?.description ?? ''),
              ],
            ),
      ],
    );
  }
}
