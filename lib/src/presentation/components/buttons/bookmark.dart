import 'package:al_quran/src/presentation/components/buttons/animation_button_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class BookmarkWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isBookmarked;
  const BookmarkWidget({super.key, required this.onTap, required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return ButtonEffect(
      onTap: onTap,
      child: Container(
        margin: REdgeInsets.only(left: 40),
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(.1),
                offset: const Offset(-2, 6),
                blurRadius: 4,
              ),
            ],
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: SvgPicture.asset(isBookmarked ? "assets/svg/bookmarkActive.svg": "assets/svg/bookmark.svg"),
      ),
    );
  }
}
