import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/local_storage.dart';
import '../auth/login/riverpod/provider/login_provider.dart';

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
    Future.delayed(const Duration(seconds: 1), () async {
      if (LocalStorage.getToken().isNotEmpty) {
        final String refreshDayString = LocalStorage.getRefreshDay();
        if (refreshDayString.isNotEmpty) {
          final DateTime refreshDay = DateTime.parse(refreshDayString);
          final DateTime now = DateTime.now();
          final Duration difference = now.difference(refreshDay);
          if (difference.inDays > 5) {
            await ref.read(loginProvider.notifier).refresh(context,
                refreshToken: LocalStorage.getRefreshToken(),
                onSuccess: (){
                  context.replaceRoute(const MainRoute());
                }
            );
            return;
          }else{
            context.replaceRoute(const MainRoute());
            return;
          }
        }
      }
      context.replaceRoute(const LoginRoute());
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
