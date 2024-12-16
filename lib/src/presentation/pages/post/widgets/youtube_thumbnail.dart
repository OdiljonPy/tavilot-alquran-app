import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:al_quran/src/core/utils/app_helpers.dart';
import 'package:al_quran/src/presentation/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles/style.dart';

class YouTubeThumbnail extends StatelessWidget {
  final String videoUrl;

  const YouTubeThumbnail({super.key, required this.videoUrl});

  String getYouTubeVideoId(String url) {
    final Uri uri = Uri.parse(url);
    return uri.queryParameters['v'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final videoId = getYouTubeVideoId(videoUrl);

    final thumbnailUrl =
        'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';

    return videoId.isNotEmpty
        ? Center(
            child: InkWell(
              onTap: () => AppHelpers.launchExternalUrl(videoUrl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: thumbnailUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: Loading(),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Icon(
                            FlutterRemix.play_circle_line,
                            size: 100.r,
                            color: Style.white,
                          )),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    LocaleKeys.watchVideo.tr(),
                    style: Style.interRegular(
                        size: 20,
                        color: Style.blue,
                        textDecoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          )
        : const Icon(Icons.error);
  }
}
