import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/routes/app_pages.dart';

void initAppServices() async {
  FlutterNativeSplash.remove();

  if (Get.find<AuthController>().user != null) {
    Get.offNamed(Routes.HOME);
  } else {
    Get.offNamed(Routes.INTRO);
  }
}
