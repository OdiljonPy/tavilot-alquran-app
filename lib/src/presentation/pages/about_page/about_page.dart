import 'package:al_quran/src/presentation/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../application/about/about_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ListView(
      children: [
        ref.watch(aboutProvider).isAboutLoading
            ? const Loading()
            : Html(data: ref.watch(aboutProvider).about?.description ?? ''),
      ],
    );
  }
}
