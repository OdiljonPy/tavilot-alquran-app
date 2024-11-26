import 'package:al_quran/application/register/register_provider.dart';
import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../../../application/confirmation/register_confirmation_provider.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../styles/style.dart';

@RoutePage()
class RegisterConfirmationPage extends ConsumerStatefulWidget {
  final String phoneNumber;
  const RegisterConfirmationPage({super.key, required this.phoneNumber});

  @override
  ConsumerState<RegisterConfirmationPage> createState() => _RegisterConfirmationPageState();
}

class _RegisterConfirmationPageState extends ConsumerState<RegisterConfirmationPage> {
  late TextEditingController register;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    register = TextEditingController(text: "+998");
    password = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registerConfirmationProvider.notifier);
    final state = ref.watch(registerConfirmationProvider);
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.mainBack,
        body: Container(
          padding: REdgeInsets.all(40.r),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              50.horizontalSpace,
              Expanded(
                child: SafeArea(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500.r),
                    child: Padding(
                      padding: EdgeInsets.only(left: 50.r, right: 50.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          60.verticalSpace,
                          Center(
                            child: Image.asset(
                              "assets/png/logo.png",
                              width: 368.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          56.verticalSpace,
                          Text(
                            LocaleKeys.codeSendToNumber.tr(),
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              color: Style.black,
                              fontWeight: FontWeight.normal,),
                          ),
                          Text(
                            widget.phoneNumber,
                            style: GoogleFonts.inter(
                                fontSize: 24.sp,
                                color: Style.black,
                                fontWeight: FontWeight.w400),
                          ),
                          36.verticalSpace,
                          SizedBox(
                            height: 64,
                            child: PinFieldAutoFill(
                              codeLength: 6,
                              currentCode: state.confirmCode,
                              onCodeChanged: notifier.setCode,
                              cursor: Cursor(
                                width: 1,
                                height: 24.r,
                                color: Style.primary,
                                enabled: true,
                              ),
                              decoration: BoxLooseDecoration(
                                gapSpace: 20.r,
                                textStyle: Style.interNormal(
                                  size: 15.sp,
                                  color:
                                  state.isCodeError ? Style.red : Style.black,
                                ),
                                bgColorBuilder: const FixedColorBuilder(
                                  Style.transparent,
                                ),
                                strokeColorBuilder: FixedColorBuilder(
                                  state.isCodeError ? Style.red : Style.colorGrey,
                                ),
                              ),
                            ),
                          ),
                          56.verticalSpace,
                          LoginButton(
                            height: 80.r,
                            isLoading: state.isLoading,
                            isActive: state.isConfirm,
                            title: LocaleKeys.confirm.tr(),
                            onPressed: () {
                                notifier.confirmCode(context, ref.watch(registerProvider).otpKey, onSuccess: (){
                                  if(context.mounted){
                                    context.router.popUntilRoot();
                                    context.replaceRoute(const LoginRoute());
                                  }
                                });
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              100.horizontalSpace,
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      image: const DecorationImage(image:  AssetImage("assets/png/loginBook.png"), fit: BoxFit.cover),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
