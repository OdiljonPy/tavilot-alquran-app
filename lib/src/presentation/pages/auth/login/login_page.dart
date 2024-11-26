import 'package:al_quran/infrastructure/translations/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../styles/style.dart';
import 'riverpod/provider/login_provider.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController login;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    login = TextEditingController(text: "+998");
    password = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return KeyboardDismisser(
      child: AbsorbPointer(
        absorbing: state.isLoading,
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
                                  fontSize: 30.sp,
                                  color: Style.black,
                                  fontWeight: FontWeight.normal,),
                            ),
                            Text(
                              LocaleKeys.enterLoginAndPassword.tr(),
                              style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  color: Style.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            36.verticalSpace,

                            OutlinedBorderTextField(
                              hintText: LocaleKeys.phoneNumber.tr(),
                              // onChanged:(s)=> notifier.setEmail(s),
                              textController: login,
                              inputType: TextInputType.phone,
                              validator: AppValidators.emptyCheck,
                              // textCapitalization: TextCapitalization.none,
                              inputFormatters: [AppHelpers.phoneFormatter()],
                              // descriptionText: state.isEmailNotValid
                              //     ? AppHelpers.getTranslation(
                              //         TrKeys.emailIsNotValid)
                              //     : (state.isLoginError
                              //         ? AppHelpers.getTranslation(
                              //             TrKeys.loginCredentialsAreNotValid)
                              //         : null),
                              // onFieldSubmitted: (value) {
                              // },
                              label: null,
                            ),
                            50.verticalSpace,
                            OutlinedBorderTextField(
                              hintText: LocaleKeys.password.tr(),
                              onChanged: notifier.setPassword,
                              textController: password,
                              obscure: true,
                              validator: AppValidators.emptyCheck,
                              inputType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.none,
                              onFieldSubmitted: (_){
                                notifier.login(
                                  phoneNumber: login.text,
                                  checkYourNetwork: () {
                                    AppHelpers.showSnackBar(
                                      context,
                                      AppHelpers.getTranslation(
                                          TrKeys.checkYourNetworkConnection),
                                    );
                                  },
                                  unAuthorised: () {
                                    AppHelpers.showSnackBar(
                                      context,
                                      AppHelpers.getTranslation(
                                          TrKeys.emailNotVerifiedYet),
                                    );
                                  },
                                  goToMain: () {
                                    context.replaceRoute(const MainRoute());
                                  },
                                );

                              },
                              // isError:
                              //     state.isLoginError || state.isEmailNotValid,
                              descriptionText: state.isEmailNotValid
                                  ? AppHelpers.getTranslation(
                                  TrKeys.emailIsNotValid)
                                  : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                  TrKeys.loginCredentialsAreNotValid)
                                  : null),
                              label: null,
                            ),
                            56.verticalSpace,
                            LoginButton(
                              height: 80.r,
                              isLoading: state.isLoading,
                              title: LocaleKeys.continueForApp.tr(),
                              onPressed: () {
                                notifier.login(
                                  phoneNumber: login.text,
                                checkYourNetwork: () {
                                  AppHelpers.showSnackBar(
                                    context,
                                    AppHelpers.getTranslation(
                                        TrKeys.checkYourNetworkConnection),
                                  );
                                },
                                unAuthorised: () {
                                  AppHelpers.showSnackBar(
                                    context,
                                    AppHelpers.getTranslation(
                                        TrKeys.emailNotVerifiedYet),
                                  );
                                },
                                goToMain: () {
                                  context.replaceRoute(const MainRoute());
                                },
                              );
                              },
                            ),
                            40.verticalSpace,
                            LoginButton(
                              titleColor: Style.primary,
                              bgColor: Style.bg,
                              // isLoading: state.isLoading,
                              title: LocaleKeys.register.tr(),
                              onPressed: () {
                                  // context.replaceRoute(const RegisterRoute());
                                  context.replaceRoute( RegisterConfirmationRoute(phoneNumber: login.text));
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
      ),
    );
  }
}
