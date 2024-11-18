import 'package:al_quran/src/presentation/pages/auth/login/login_page.dart';
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
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final token = LocalStorage.getToken();
      if (token.isNotEmpty) {
        context.replaceRoute(const MainRoute());
      } else {
        context.replaceRoute(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/png/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
