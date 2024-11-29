import 'package:al_quran/application/register/register_provider.dart';
import 'package:al_quran/src/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../infrastructure/translations/locale_keys.g.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../styles/style.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
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
    final notifier = ref.read(registerProvider.notifier);
    final state = ref.watch(registerProvider);
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
                            LocaleKeys.hi.tr(),
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              color: Style.black,
                              fontWeight: FontWeight.normal,),
                          ),
                          Text(
                            LocaleKeys.registerToContinue.tr(),
                            style: GoogleFonts.inter(
                                fontSize: 24.sp,
                                color: Style.black,
                                fontWeight: FontWeight.w400),
                          ),
                          36.verticalSpace,

                          OutlinedBorderTextField(
                            hintText: LocaleKeys.phoneNumber.tr(),
                            textController: register,
                            inputType: TextInputType.phone,
                            validator: AppValidators.emptyCheck,
                            inputFormatters: [AppHelpers.phoneFormatter()],

                            label: null,
                          ),
                          50.verticalSpace,
                          OutlinedBorderTextField(
                            hintText: LocaleKeys.password.tr(),
                            onChanged: notifier.setPassword,
                            textController: password,
                            obscure: state.showPassword,
                            suffixIcon: IconButton(
                              onPressed: notifier.toggleShowPassword,
                              icon: SvgPicture.asset(
                                state.showPassword
                                    ? "assets/svg/eyeClose.svg"
                                    : "assets/svg/eye.svg",
                              ),
                            ),
                            validator: AppValidators.emptyCheck,
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            onFieldSubmitted: (_){
                              notifier.register(
                                onSuccess: () {
                                  context.pushRoute(
                                      RegisterConfirmationRoute(
                                          phoneNumber: register.text));
                                },
                                context,
                                phoneNumber: register.text,
                                password: password.text,
                              );
                            },
                            label: null,
                          ),
                          56.verticalSpace,
                          LoginButton(
                            height: 80.r,
                            isLoading: state.isLoading,
                            title: LocaleKeys.continueForApp.tr(),
                            onPressed: () {
                              notifier.register(
                                onSuccess: () {
                                  context.pushRoute(
                                      RegisterConfirmationRoute(
                                          phoneNumber: register.text));
                                },
                                context,
                                phoneNumber: register.text,
                                password: password.text,
                              );
                            },
                          ),
                          40.verticalSpace,
                          LoginButton(
                            titleColor: Style.primary,
                            bgColor: Style.bg,
                            // isLoading: state.isLoading,
                            title: LocaleKeys.enterWithPassword.tr(),
                            onPressed: () {
                              context.replaceRoute(const LoginRoute());
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
