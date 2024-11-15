import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/app_helpers.dart';
import '../../../core/utils/local_storage.dart';
import '../../components/app_logo.dart';
import '../../components/components.dart';
import '../../styles/style.dart';
import '../auth/pin_code/components/pin_button.dart';
import '../auth/pin_code/components/pin_container.dart';
import '../auth/pin_code/riverpod/provider/pin_code_provider.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(pinCodeProvider.notifier);
    final state = ref.watch(pinCodeProvider);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 500.r),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.verticalSpace,
                    Row(
                      children: [
                        36.horizontalSpace,
                        const AppLogo()
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          36.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(1 >0
                                ? TrKeys.enterNewPinCode
                                : state.isPinCodeNotValid == false
                                ? TrKeys.enterPinCode
                                : TrKeys.enterPinCodeError),
                            style: GoogleFonts.inter(
                              color: state.isPinCodeNotValid == false
                                  ? Style.black
                                  : Style.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 28.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          12.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(
                                state.isPinCodeNotValid == false
                                    ? TrKeys.pinCodeDesc
                                    : TrKeys.pinCodeDescError),
                            style: GoogleFonts.inter(
                              color: state.isPinCodeNotValid == false
                                  ? Style.black
                                  : Style.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          24.verticalSpace,
                          SizedBox(
                            height: 28.r,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return PinContainer(
                                    isActive: state.pinCode.length > index,
                                  );
                                }),
                          ),
                          GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  vertical: 24.r, horizontal: 108.r),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              shrinkWrap: true,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 28.r,
                                mainAxisSpacing: 24.r,
                                mainAxisExtent: 72.r,
                              ),
                              itemBuilder: (context, index) {
                                return PinButton(
                                  title: index != 9 && index != 11
                                      ? AppHelpers.getPinCodeText(index)
                                      : null,
                                  iconData: index == 9
                                      ? FlutterRemix.close_circle_line
                                      : index == 11
                                      ? FlutterRemix.delete_back_2_line
                                      : null,
                                  onTap: () {
                                    if (index == 9) {
                                      notifier.clearPinCode();
                                    } else if (index == 11) {
                                      notifier.removePinCode();
                                    } else {
                                      if (1 >0) {
                                        notifier.setNewPinCode(
                                          code:
                                          AppHelpers.getPinCodeText(index),
                                          onSuccess: () {
                                            context.replaceRoute(
                                                const MainRoute());
                                          },
                                        );
                                      } else {
                                        notifier.setPinCode(
                                          code:
                                          AppHelpers.getPinCodeText(index),
                                          onSuccess: () {
                                            context.replaceRoute(
                                                const MainRoute());
                                          },
                                        );
                                      }
                                    }
                                  },
                                );
                              }),
                          24.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 98.r),
                            child: LoginButton(
                                borderRadius: 15.r,
                                title: AppHelpers.getTranslation(
                                    1 >0 ? TrKeys.save : TrKeys.apply),
                                onPressed: () {
                                  if (1 >0) {
                                    notifier.checkNewCode(onSuccess: () {
                                      context.replaceRoute(const MainRoute());
                                    });
                                  } else {
                                    notifier.checkCode(onSuccess: () {
                                      context.replaceRoute(const MainRoute());
                                    });
                                  }
                                }),
                          ),
                          if (!false)
                            Column(
                              children: [
                                12.verticalSpace,
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 98.r),
                                  child: LoginButton(
                                      titleColor: Style.black,
                                      bgColor: Style.transparent,
                                      title: AppHelpers.getTranslation(
                                          TrKeys.logout),
                                      onPressed: () {
                                        context
                                            .replaceRoute(const LoginRoute());
                                        LocalStorage.clearStore();
                                      }),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Image.asset(
                  Assets.pngSplashGirl,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}

