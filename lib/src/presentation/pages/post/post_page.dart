import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/presentation/components/buttons/custom_back_button.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../application/for_students/for_students_provider.dart';
import '../../styles/style.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: REdgeInsets.all(40),
      child: ref.watch(forStudentsProvider)
          .isPostLoading
          ? const Center(child: Loading())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ref.watch(forStudentsProvider).post?.title ?? "",
          ),
          Text(
            ref.watch(forStudentsProvider).post?.description ?? "",
          ),
          Image.asset("assets/png/pdf.png"),

          LoginButton(title: "Yuklab olish", onPressed: (){}),
        ],
      ),
    );
  }
}
