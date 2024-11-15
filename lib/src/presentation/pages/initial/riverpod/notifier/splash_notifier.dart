import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../state/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashState> {

  SplashNotifier() : super(const SplashState());

}
