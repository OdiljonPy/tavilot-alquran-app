import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'for_students_notifier.dart';
import 'for_students_state.dart';


final forStudentsProvider = StateNotifierProvider<ForStudentsNotifier, ForStudentsState>(
  (ref) => ForStudentsNotifier(),
);
