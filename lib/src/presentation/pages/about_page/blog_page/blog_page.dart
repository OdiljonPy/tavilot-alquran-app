import 'package:al_quran/src/presentation/components/components.dart';
import 'package:al_quran/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';
import '../../../styles/style.dart';

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({super.key});

  @override
  ConsumerState<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends ConsumerState<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.r,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/png/mainSearchBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: OutlinedBorderTextField(
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Style.textHint,
                        ),
                        label: null,
                        hintText: "Нима ӯқимоқчисиз?  ",
                        color: Style.white,
                        radius: 40,
                      )),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              )),
          60.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: REdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Style.secondary,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 180.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/svg/book.svg",
                          height: 30, width: 30, color: Style.black),
                      const Spacer(),
                      Text(
                        "Таъвилот Ал-Қуръон ўкувчиларига",
                        style: Style.interRegular(size: 24, color: Style.black),
                      )
                    ],
                  ),
                )),
                12.horizontalSpace,
                Expanded(
                    child: Container(
                  padding: REdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Style.secondary,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 180.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/svg/bag.svg",
                          height: 30, width: 30, color: Style.black),
                      const Spacer(),
                      Text(
                        "Xаридлар",
                        style: Style.interRegular(size: 24, color: Style.black),
                      )
                    ],
                  ),
                )),
                12.horizontalSpace,
                Expanded(
                    child: Container(
                  padding: REdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Style.secondary,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 180.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/info.svg",
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
                      Text(
                        "Дастур ҳақида",
                        style: Style.interRegular(size: 24, color: Style.black),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          60.verticalSpace,
          Padding(
              padding: REdgeInsets.only(left: 40, bottom: 30),
              child: Text(
                "Суралар",
                style: Style.interNormal(size: 36, color: Style.black),
              )),
          ref.watch(mainProvider).chapters.isEmpty
              ? const Loading()
              : GridView.builder(
                  padding: REdgeInsets.all(40),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12.r,
                      crossAxisSpacing: 12.r,
                      crossAxisCount: 3,
                      mainAxisExtent: 110.r),
                  itemCount: ref.read(mainProvider).chapters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ButtonEffect(
                      child: Container(
                        padding: REdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Style.borderColor, width: 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 60.r,
                              width: 60.r,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.star,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: const Alignment(0, -.5),
                                child: Text(
                                  "${index + 1}",
                                  style: Style.interRegular(
                                      size: 24, color: Style.white),
                                ),
                              ),
                            ),
                            20.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${ref.read(mainProvider).chapters[index].name}",
                                  style: Style.interRegular(
                                      size: 24, color: Style.black),
                                ),
                                Text(
                                  "Маккада нозил бўлган, 7 оятдан иборат",
                                  style: Style.interRegular(
                                      size: 10, color: Style.black),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    "${ref.read(mainProvider).chapters[index].nameArabic}",
                                    style: Style.interRegular(
                                        size: 20, color: Style.black)),
                                Text(
                                  "7 oyat",
                                  style: Style.interRegular(
                                      size: 10, color: Style.textHint),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
