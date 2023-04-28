import 'package:flutter_project/widget/app_debug.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configProvider = FutureProvider<String>((ref) async {
  AppDebug.log("----start:${DateTime.now()}");
  await Future.delayed(const Duration(seconds: 4));
  AppDebug.log("----stop:${DateTime.now()}");
  return "future response.";
});
